from database.conexion import conectar

def insertar_persona(persona):
    conexion = conectar()
    cursor = conexion.cursor()
    
    # ✅ Opción A: Sintaxis ODBC CALL (recomendada con pyodbc)
    sql = "{CALL LFCV.sp_insertarPersona (?,?,?,?,?,?,?,?,?,?,?,?)}"
    
    # Ejecutamos el procedimiento con los parámetros
    parametros = (
        persona.tipo_persona,
        persona.nombres,
        persona.apaterno,
        persona.amaterno,
        persona.razon_social,
        persona.nombre_comercial,
        persona.id_tipo_documento,
        persona.numero_documento,
        persona.telefono,
        persona.email,
        persona.id_nacionalidad,
        persona.estado
    )
    
    try:
        cursor.execute(sql, parametros)
        conexion.commit()
        print("Inserción exitosa")
    except Exception as e:
        print("Error en la inserción:", e)
    finally:
        cursor.close()
        conexion.close()
def buscar_persona_dni(dni):
    conexion = conectar()
    try:
        cursor = conexion.cursor()
        cursor.execute("EXEC lfcv.sp_buscar_persona_dni ?", (dni,))
        persona = cursor.fetchone()
        return persona
    finally:
        cursor.close()
        conexion.close()

def actualizar_persona(id_persona, nombres, apaterno, amaterno, telefono):
    conexion = conectar()
    try:
        cursor = conexion.cursor()
        cursor.execute("EXEC lfcv.sp_actualizar_persona ?, ?, ?, ?, ?", (id_persona, nombres, apaterno, amaterno, telefono))
        conexion.commit()
    finally:
        cursor.close()
        conexion.close()

def eliminar_persona(id_persona):
    conexion = conectar()
    try:
        cursor = conexion.cursor()
        cursor.execute("EXEC lfcv.sp_eliminar_persona ?", (id_persona,))
        conexion.commit()
    finally:
        cursor.close()
        conexion.close()