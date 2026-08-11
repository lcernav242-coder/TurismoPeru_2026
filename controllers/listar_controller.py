from database.conexion import conectar

def listarpersonas():
    conexion = conectar()
    try:
        cursor = conexion.cursor()
        cursor.execute("EXEC lfcv.sp_listar_personas")
        personas = cursor.fetchall()
        return personas
    finally:
        cursor.close()
        conexion.close()

def listarclientes():
    conexion = conectar()
    try:
        cursor = conexion.cursor()
        # Aquí se cambia el procedimiento al nuevo que tiene el JOIN
        cursor.execute("EXEC lfcv.sp_listar_clientes_detalle")
        clientes = cursor.fetchall()
        return clientes
    finally:
        cursor.close()
        conexion.close()