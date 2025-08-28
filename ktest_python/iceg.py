from pyiceberg.catalog.sql import SqlCatalog
from pyiceberg.schema import Schema
from pyiceberg.types import StringType, IntegerType, NestedField
import pyarrow as pa
import os
import pathlib

class IcebergManager:
    def __init__(self, warehouse_path="/home/avorovich/av_openacr/ktest_python/iceberg_warehouse", namespace="default", table_name="my_iceberg_table"):
        self.warehouse_path = warehouse_path
        self.namespace = namespace
        self.table_name = table_name
        self.catalog = None
        self.table = None
        self.schema = None
        self.arrow_schema = None

    def arrow_schema_build(self):
        self.arrow_schema = pa.schema([
            pa.field("id", pa.int32(), nullable=False),
            pa.field("name", pa.string(), nullable=True),
            pa.field("age", pa.int32(), nullable=True)
        ])

    def create_catalog_and_table(self):
        # Ensure the warehouse directory exists and is writable
        pathlib.Path(self.warehouse_path).mkdir(parents=True, exist_ok=True)
        if not os.access(self.warehouse_path, os.W_OK):
            raise RuntimeError(f"No write permission for warehouse path: {self.warehouse_path}")

        # Use a file-based SQLite database with a normalized path
        catalog_db_path = os.path.join(self.warehouse_path, "catalog.db")
        catalog_db_path = os.path.abspath(catalog_db_path)  # Normalize path
        catalog_db_uri = f"sqlite:///{catalog_db_path}"

        self.catalog = SqlCatalog(
            name="local",
            uri=catalog_db_uri,
            warehouse=f"file://{os.path.abspath(self.warehouse_path)}",
        )
        try:
            self.catalog.create_namespace(self.namespace)
            print(f"Created namespace '{self.namespace}'")
        except Exception as e:
            if "already exists" in str(e).lower():
                print(f"Namespace '{self.namespace}' already exists")
            else:
                raise e
        self.schema = Schema(
            NestedField(field_id=1, name="id", field_type=IntegerType(), required=True),
            NestedField(field_id=2, name="name", field_type=StringType(), required=False),
            NestedField(field_id=3, name="age", field_type=IntegerType(), required=False),
        )
        table_identifier = f"{self.namespace}.{self.table_name}"
        self.table = self.catalog.create_table(
            identifier=table_identifier,
            schema=self.schema,
            location=f"file://{os.path.abspath(self.warehouse_path)}/{table_identifier.replace('.', '/')}",
        )
        self.arrow_schema_build()
        print(f"Created table '{table_identifier}'")

    def use_existing_catalog_and_table(self):
        if not os.path.exists(self.warehouse_path):
            raise RuntimeError(f"Warehouse path {self.warehouse_path} does not exist.")
        # Use the same file-based SQLite database as in create_catalog_and_table
        catalog_db_path = os.path.join(self.warehouse_path, "catalog.db")
        catalog_db_path = os.path.abspath(catalog_db_path)  # Normalize path
        catalog_db_uri = f"sqlite:///{catalog_db_path}"
        self.catalog = SqlCatalog(
            name="local",
            uri=catalog_db_uri,
            warehouse=f"file://{os.path.abspath(self.warehouse_path)}",
        )
        table_identifier = f"{self.namespace}.{self.table_name}"
        try:
            self.table = self.catalog.load_table(identifier=table_identifier)
            print(f"Loaded table '{table_identifier}'")
        except Exception as e:
            raise RuntimeError(f"Failed to load table '{table_identifier}': {str(e)}")
        # Extract schema from the loaded table
        self.schema = self.table.schema
        self.arrow_schema_build()

    def append_data(self, data):
        if self.table is None:
            raise RuntimeError("Table not created. Call create_catalog_and_table() or use_existing_catalog_and_table() first.")
        # Convert to schema format
        data2 = pa.Table.from_pydict(
            data,
            schema=self.arrow_schema
        )
        # Append data to the Iceberg table
        self.table.append(data2)
        print("Data appended successfully")

    def read_data(self):
        if self.table is None:
            raise RuntimeError("Table not created. Call create_catalog_and_table() or use_existing_catalog_and_table() first.")
        # Read all data as a PyArrow Table
        return self.table.scan().to_arrow()

    def test_write(self):
        self.create_catalog_and_table()
        sample1 = {
            "id": [1, 2, 3],
            "name": ["Alice", "Bob", "Charlie"],
            "age": [25, 30, 35]
        }
        self.append_data(sample1)
        self.append_data(sample1)
        print("Data appended successfully in test_write.")
        out = self.read_data()
        print("Read data in test_write:")
        print(out)
        print("Data read successfully in test_write.")

    def test_read(self):
        self.use_existing_catalog_and_table()
        out = self.read_data()
        print("Read data in test_read:")
        print(out)
        print("Data read successfully in test_read.")

# Example usage:
if __name__ == "__main__":
    manager = IcebergManager()
    # manager.test_write()
    # Uncomment to test reading in a separate run
    manager.test_read()