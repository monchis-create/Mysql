# # esto es para conectarme a la base de datos de mysql con python
# import mysql.connector

# conexion = mysql.connector.connect(
#     host="localhost",
#     user="root",  # Reemplaza con tu usuario
#     password="MantisBorrachonTaichi1717.",  # Reemplaza con tu contraseña
#     database="ingresos",
#     charset="utf8mb4",  # 👈 Fuerza el charset
#     collation="utf8mb4_unicode_ci"  # 👈 Cambia la collation aquí
# )

# cursor = conexion.cursor()

# # Verificar la conexión
# print("✅ Conexión exitosa con charset y collation correctos")

# cursor.close()
# conexion.close()




# # Este codigo es para ver las tablas de la base de datos
# import mysql.connector

# # Conectar a la base de datos
# conexion = mysql.connector.connect(
#     host="localhost",
#     user="root",  # Reemplaza con tu usuario
#     password="MantisBorrachonTaichi1717.",  # Reemplaza con tu contraseña
#     database="ingresos",
#     charset="utf8mb4",
#     collation="utf8mb4_unicode_ci"
# )

# cursor = conexion.cursor()

# # Ejecutar la consulta para obtener las tablas
# cursor.execute("SHOW TABLES")

# print("📋 Listado de tablas:")
# for tabla in cursor:
#     print(f" - {tabla[0]}")

# # Cerrar conexión
# cursor.close()
# conexion.close()









import mysql.connector
from tabulate import tabulate  # Importamos tabulate

# Conectar a la base de datos
conexion = mysql.connector.connect(
    host="localhost",
    user="root",  # Reemplaza con tu usuario
    password="MantisBorrachonTaichi1717.",  # Reemplaza con tu contraseña
    database="ingresos",
    charset="utf8mb4",
    collation="utf8mb4_unicode_ci"
)

cursor = conexion.cursor()

# Listar todas las tablas
cursor.execute("SHOW TABLES")
tablas = [tabla[0] for tabla in cursor.fetchall()]

# Mostrar los datos de cada tabla en formato de tabla ordenada
for tabla in tablas:
    print(f"\n📂 Datos en la tabla: {tabla}")
    
    # Obtener los nombres de las columnas
    cursor.execute(f"SHOW COLUMNS FROM {tabla}")
    columnas = [col[0] for col in cursor.fetchall()]
    
    # Obtener los datos de la tabla
    cursor.execute(f"SELECT * FROM {tabla}")
    filas = cursor.fetchall()
    
    if filas:
        print(tabulate(filas, headers=columnas, tablefmt="grid"))  # 👈 Aquí usamos tabulate
    else:
        print("🔍 La tabla está vacía.")

# Cerrar conexión
cursor.close()
conexion.close()
