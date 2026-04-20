from pyspark.sql import SparkSession
import os

# Initialize Spark session
spark = SparkSession.builder \
    .appName("SQLServerToJSON") \
    .config("spark.jars", "C:\\path\\to\\mssql-jdbc-9.4.1.jre8.jar") \
    .getOrCreate()

# Connection details
server = r"DESKTOP-DVCTLQ2\SQLEXPRESS"
database = "meanlifestudies"
username = "mahendra204"
password = "9441766728"
driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"

# Local storage path for JSON exports
output_path = r"C:\Users\Admin\Desktop\Dbtables_loc2"
os.makedirs(output_path, exist_ok=True)

# Build JDBC URL
jdbc_url = f"jdbc:sqlserver://{server};databaseName={database};user={username};password={password}"

# Step 1: Get all table names using a metadata query
tables_df = spark.read.format("jdbc") \
    .option("url", jdbc_url) \
    .option("driver", driver) \
    .option("query", "SELECT name FROM sys.tables") \
    .load()

tables = [row["name"] for row in tables_df.collect()]
print("Tables found:", tables)

# Step 2: Export each table to JSON
for table in tables:
    df = spark.read.format("jdbc") \
        .option("url", jdbc_url) \
        .option("driver", driver) \
        .option("dbtable", table) \
        .load()
    
    file_path = os.path.join(output_path, table)
    df.write.mode("overwrite").json(file_path)
    print(f"Table {table} transferred to {file_path}")

print("All tables exported successfully to JSON files.")
