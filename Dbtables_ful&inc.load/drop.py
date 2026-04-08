import pandas as pd
from sqlalchemy import create_engine, text

# Connection details
server = r'DESKTOP-DVCTLQ2\SQLEXPRESS'
database = 'edf'
username = 'mahendra204'
password = '9441766728'
driver = 'ODBC Driver 17 for SQL Server'

# Build connection string
connection_string = (
    f"mssql+pyodbc://{username}:{password}@{server}/{database}?driver={driver}"
)
engine = create_engine(connection_string)

# Step 1: Get all table names
tables_query = "SELECT name FROM sys.tables;"
tables = pd.read_sql(tables_query, engine)['name'].tolist()

# Step 2: Keep only the ones we want to preserve
preserve_tables = ["data2"]
drop_tables = [t for t in tables if t not in preserve_tables]

# Step 3: Drop each unwanted table
with engine.connect() as conn:
    for table in drop_tables:
        try:
            drop_query = f"DROP TABLE [{table}];"
            conn.execute(text(drop_query))
            print(f"❌ Dropped table: {table}")
        except Exception as e:
            print(f"⚠️  Could not drop table {table}: {str(e)[:80]}...")
    conn.commit()

print("🎉 All unwanted tables dropped successfully. Preserved tables: abc, data2")
