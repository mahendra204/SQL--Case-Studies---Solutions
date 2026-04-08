import os
import pandas as pd
from sqlalchemy import create_engine

# Connection details
server = r'DESKTOP-DVCTLQ2\SQLEXPRESS'
database = 'edf'
username = 'mahendra204'
password = '9441766728'
driver = 'ODBC Driver 17 for SQL Server'

# Local storage path for CSV exports
output_path = r"C:\Users\Admin\Desktop\Dbtables_ful&inc.load"
os.makedirs(output_path, exist_ok=True)

# Build connection string
connection_string = (
    f"mssql+pyodbc://{username}:{password}@{server}/{database}?driver={driver}"
)
engine = create_engine(connection_string)

# Step 1: Get all table names
tables_query = "SELECT name FROM sys.tables;"
tables = pd.read_sql(tables_query, engine)['name'].tolist()

# Step 2: Export each table to CSV
for table in tables:
    query = f"SELECT * FROM {table}"
    df = pd.read_sql(query, engine)
    
    file_path = os.path.join(output_path, f"{table}.csv")
    df.to_json(file_path, index=False)
    print(f"✅ Exported {table} to {file_path}")

print("🎉 All tables exported successfully to CSV files.")
