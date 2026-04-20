import os
import pandas as pd
from sqlalchemy import create_engine

# Connection details
server = r'DESKTOP-DVCTLQ2\SQLEXPRESS'
database = 'meanlifestudies'
username = 'mahendra204'
password = "XXXXXXXXXXX"
driver = 'ODBC Driver 17 for SQL Server'

# Local storage path for json exports
output_path = r"C:\Users\Admin\Desktop\Dbtables_loc2"
os.makedirs(output_path, exist_ok=True)

# Build connection string
connection_string = (
    f"mssql+pyodbc://{username}:{password}@{server}/{database}?driver={driver}"
)
engine = create_engine(connection_string)

# Step 1: Get all table names
tables_query = "SELECT name FROM sys.tables;"
tables = pd.read_sql(tables_query, engine)['name'].tolist()

print(tables)

# Step 2: Export each table to json
for table in tables:
    query = f"SELECT * FROM {table}"
    df = pd.read_sql(query, engine)
    
    file_path = os.path.join(output_path, f"{table}.json")
    df.to_json(file_path, index=False)
    print(f" Table {table} transferred to {file_path}")

print(" All tables exported successfully to JSON files.")

