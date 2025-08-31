from pyiceberg.catalog import load_catalog
from pyiceberg.catalog.sql import SqlCatalog
from pyiceberg.schema import Schema
from pyiceberg.io.pyarrow import schema_to_pyarrow
from pyiceberg.types import StringType, IntegerType, NestedField
import pyarrow as pa
import os
import pathlib
import shutil

class IcebergManager:
    def __init__(self, storage_type="local"):
        self.storage_type = storage_type.lower()  # 'local' or 'minio'
        self.warehouse_path = "/home/avorovich/av_openacr/ktest_python/iceberg_warehouse"
        self.warehouse_bucket = "iceberg-warehouse"
        self.namespace = "default999"
        self.table_name = "my_iceberg_table11"
        self.table_identifier = f"{self.namespace}.{self.table_name}"
        self.catalog = None
        self.table = None
        self.schema = None
        self.arrow_schema = None
        self.uri="http://localhost:8181"
        # self.uri="http://192.168.10.51:1758"
        self.s3_endpoint="http://dev.x2-4.minio-1.ext-0:1673"
        self.s3_access_key_id="minioadmin"
        self.s3_secret_access_key="minioadmin"

    def _init_local_catalog(self):
        # Ensure the warehouse directory exists and is writable
        pathlib.Path(self.warehouse_path).mkdir(parents=True, exist_ok=True)
        if not os.access(self.warehouse_path, os.W_OK):
            raise RuntimeError(f"No write permission for warehouse path: {self.warehouse_path}")

        # Use a file-based SQLite database with a normalized path
        catalog_db_path = os.path.join(self.warehouse_path, "catalog.db")
        catalog_db_path = os.path.abspath(catalog_db_path)
        catalog_db_uri = f"sqlite:///{catalog_db_path}"

        self.catalog = SqlCatalog(
            name="local",
            uri=catalog_db_uri,
            warehouse=f"file://{os.path.abspath(self.warehouse_path)}",
        )

    def _init_minio_catalog(self):
        # Configure environment variables for MinIO access
        os.environ["AWS_ACCESS_KEY_ID"] = "admin"
        os.environ["AWS_SECRET_ACCESS_KEY"] = "password"
        os.environ["AWS_DEFAULT_REGION"] = "us-east-1"

        # Initialize REST catalog for MinIO
        self.catalog = load_catalog(
            name="rest",
            **{
                "uri": self.uri,
                "s3.endpoint": self.s3_endpoint,
                "s3.access-key-id": self.s3_access_key_id,  
                "s3.secret-access-key":self.s3_secret_access_key,
                "warehouse": f"s3://{self.warehouse_bucket}",
                "py-io-impl": "pyiceberg.io.pyarrow.PyArrowFileIO"
            }
        )

    def _init_catalog(self):
        if self.storage_type == "local":
            self._init_local_catalog()
        elif self.storage_type == "minio":
            self._init_minio_catalog()
        else:
            raise ValueError(f"Unsupported storage_type: {self.storage_type}. Use 'local' or 'minio'.")
        
    def get_location(self):
        table_path = self.table_identifier.replace('.', '/')
        if self.storage_type == "local":
            return f"file://{os.path.abspath(self.warehouse_path)}/{table_path}"
        else:
            return f"s3://{self.warehouse_bucket}/{table_path}"

    def create_catalog_and_table(self):
        if self.storage_type == "local":
            # Remove existing warehouse for a fresh start (local only)
            if os.path.exists(self.warehouse_path) and "iceberg" in self.warehouse_path:
                shutil.rmtree(self.warehouse_path)
            pathlib.Path(self.warehouse_path).mkdir(parents=True, exist_ok=True)

        self._init_catalog()

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
        #  Convert to PyArrow schema needed for data appending
        self.arrow_schema = schema_to_pyarrow(self.schema)
        
        location = self.get_location()
        self.table = self.catalog.create_table(
            identifier=self.table_identifier,
            schema=self.schema,
            location=location,
        )
        print(f"Created table '{self.table_identifier}'")

    def use_existing_catalog_and_table(self):
        if self.storage_type == "local" and not os.path.exists(self.warehouse_path):
            raise RuntimeError(f"Warehouse path {self.warehouse_path} does not exist.")
        self._init_catalog()
        try:
            self.table = self.catalog.load_table(identifier=self.table_identifier)
            print(f"Loaded table in memory'{self.table_identifier}'")
        except Exception as e:
            raise RuntimeError(f"Failed to load table '{self.table_identifier}': {str(e)}")
        # Extract schema from the loaded table
        self.schema = self.table.schema

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
        print("Starting test_write...")
        self.create_catalog_and_table()
        sample1 = {
            "id": [1, 2, 3],
            "name": ["Alice", "Bob", "Charlie"],
            "age": [25, 30, 35]
        }
        self.append_data(sample1)
        self.append_data(sample1)
        self.append_data(sample1)
        print("Data appended successfully in test_write.")
        out = self.read_data()
        print("Read data in test_write:")
        print(out)
        print("Data read successfully in test_write.")

    def test_read(self):
        print
        self.use_existing_catalog_and_table()
        out = self.read_data()
        print("Read data in test_read:")
        print(out)
        print("Data read successfully in test_read.")

# Example usage:
if __name__ == "__main__":
    storage_type = "local"
    storage_type = "minio"
    manager = IcebergManager(storage_type)
    write_test = True
    write_test = False
    if write_test:
        manager.test_write()
    else:
        manager.test_read()