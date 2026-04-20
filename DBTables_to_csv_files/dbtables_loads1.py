import os
import json
import pandas as pd
from datetime import datetime
from sqlalchemy import create_engine

# Connection details
server = r'DESKTOP-DVCTLQ2\SQLEXPRESS'
database = 'edf'
username = 'mahendra204'
password = 'XXXXXXXXXX'
driver = 'ODBC Driver 17 for SQL Server'

output_path = r"C:\Users\Admin\Desktop\Dbtables_ful&inc.load"
metadata_file = os.path.join(output_path, "metadata.json")
os.makedirs(output_path, exist_ok=True)

# Create database connection
connection_string = f"mssql+pyodbc://{username}:{password}@{server}/{database}?driver={driver}"
engine = create_engine(connection_string)

def get_metadata():
    """Load metadata with last load timestamps."""
    if os.path.exists(metadata_file):
        with open(metadata_file, 'r') as f:
            return json.load(f)
    return {}

def save_metadata(metadata):
    """Save metadata with last load timestamps."""
    with open(metadata_file, 'w') as f:
        json.dump(metadata, f)

def export_table(table, is_full_load=True, file_format='csv'):
    """
    Export a table to file with incremental support.
    Parameters:
        table: Table name
        is_full_load: True for full load, False for incremental
        file_format: 'csv' or 'json'
    """
    metadata = get_metadata()
    
    if is_full_load:
        query = f"SELECT * FROM {table}"
    else:
        last_load = metadata.get(table, "1900-01-01")
        # Assumes table has 'created_date' or 'updated_date' column
        query = f"SELECT * FROM {table} WHERE updated_date > '{last_load}' OR created_date > '{last_load}'"
    
    df = pd.read_sql(query, engine)
    
    if len(df) == 0:
        print(f"⏭️  {table}: No new data")
        return
    
    # Save to file
    file_path = os.path.join(output_path, f"{table}.{file_format}")
    if file_format == 'csv':
        df.to_csv(file_path, index=False)
    elif file_format == 'json':
        df.to_json(file_path, orient='records')
    
    # Update metadata
    metadata[table] = datetime.now().isoformat()
    save_metadata(metadata)
    
    print(f"✅ {table}: {len(df)} records exported to {file_format.upper()}")

# Usage
if __name__ == "__main__":
    import sys
    
    load_type = sys.argv[1] if len(sys.argv) > 1 else 'full'  # 'full' or 'incremental'
    file_format = sys.argv[2] if len(sys.argv) > 2 else 'csv'  # 'csv' or 'json'
    
    # Get all tables
    tables = pd.read_sql("SELECT name FROM sys.tables;", engine)['name'].tolist()
    
    print(f"\n{load_type.upper()} load starting...")
    for table in tables:
        export_table(table, is_full_load=(load_type=='full'), file_format=file_format)
    print("✅ Done!\n")
