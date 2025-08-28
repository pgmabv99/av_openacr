from pyiceberg.catalog.sql import SqlCatalog
from pyiceberg.schema import Schema
from pyiceberg.types import StringType, IntegerType, NestedField
import pyarrow as pa
import os

class IcebergManager:
    def __init__(self, warehouse_path="./iceberg_warehouse", namespace="default", table_name="my_iceberg_table"):
        self.warehouse_path = warehouse_path
        self.namespace = namespace
        self.table_name = table_name
        self.catalog = None
        self.table = None

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
        schema = Schema(
            NestedField(field_id=1, name="id", field_type=IntegerType(), required=True),
            NestedField(field_id=2, name="name", field_type=StringType(), required=False),
            NestedField(field_id=3, name="age", field_type=IntegerType(), required=False),
        )
        table_identifier = f"{self.namespace}.{self.table_name}"
        self.table = self.catalog.create_table(
            identifier=table_identifier,
            schema=schema,
            location=f"file://{self.warehouse_path}/{table_identifier.replace('.', '/')}",
        )

    def append_data(self, data):
        if self.table is None:
            raise RuntimeError("Table not created. Call create_catalog_and_table() first.")
        self.table.append(data)

# Example usage:
if __name__ == "__main__":
    manager = IcebergManager()
    manager.create_catalog_and_table()

    arrow_schema = pa.schema([
        pa.field("id", pa.int32(), nullable=False),
        pa.field("name", pa.string(), nullable=True),
        pa.field("age", pa.int32(), nullable=True)
    ])
    data = pa.Table.from_pydict(
        {
            "id": [1, 2, 3],
            "name": ["Alice", "Bob", "Charlie"],
            "age": [25, 30, 35]
        },
        schema=arrow_schema
    )
    manager.append_data(data)
    print("Data appended successfully.")
