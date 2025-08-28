from pyiceberg.catalog.sql import SqlCatalog
from pyiceberg.schema import Schema
from pyiceberg.types import StringType, IntegerType, NestedField
import pyarrow as pa
import os

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
        if not os.path.exists(self.warehouse_path):
            os.makedirs(self.warehouse_path)
        self.catalog = SqlCatalog(
            name="local",
            uri="sqlite:///:memory:",
            warehouse=f"file://{self.warehouse_path}",
        )
        try:
            self.catalog.create_namespace(self.namespace)
        except Exception as e:
            if "already exists" not in str(e).lower():
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
            location=f"file://{self.warehouse_path}/{table_identifier.replace('.', '/')}",
        )
        self.arrow_schema_build()


    def use_existing_catalog_and_table(self):
        if not os.path.exists(self.warehouse_path):
            raise RuntimeError(f"Warehouse path {self.warehouse_path} does not exist.")
        self.catalog = SqlCatalog(
            name="local",
            uri="sqlite:///:memory:",
            warehouse=f"file://{self.warehouse_path}",
        )
        table_identifier = f"{self.namespace}.{self.table_name}"
        self.table = self.catalog.load_table(identifier=table_identifier)
        # Extract schema from the loaded table
        self.schema = self.table.schema
        self.arrow_schema_build()

    def append_data(self, data):
        if self.table is None:
            raise RuntimeError("Table not created. Call create_catalog_and_table() first.")
        # convert to schema format 
        data2 = pa.Table.from_pydict(
            data,
            schema=self.arrow_schema
        )
        # Append data to the Iceberg table
        self.table.append(data2)

    def read_data(self):
        if self.table is None:
            raise RuntimeError("Table not created. Call create_catalog_and_table() first.")
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
        print("Data appended successfully.")
        out = self.read_data()
        print(out)
        print("Data read successfully.")

    def test_read(self):
        manager.use_existing_catalog_and_table()
        out=manager.read_data()
        print(out)
        print("Data read successfully.")


# Example usage:
if __name__ == "__main__":
    manager = IcebergManager()
    # manager.test_write()
    manager.test_read()


