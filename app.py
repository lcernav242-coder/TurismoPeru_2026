from flask import *
from models.cliente import Cliente
from models.persona import Persona
from controllers.listar_controller import listarclientes, listarpersonas
from controllers.persona_controller import insertar_persona, buscar_persona_dni, actualizar_persona, eliminar_persona

app = Flask(__name__)

@app.route("/")
def inicio():
    personas = listarpersonas()
    return render_template(
        "index.html",
        personas=personas
    )

@app.route("/clientes")
def client():
    # Esta ruta ahora ejecutará internamente sp_listar_clientes_detalle
    clientes = listarclientes()
    return render_template(
        "clientes.html",
        clientes=clientes
    )

@app.route("/nuevo")
def nuevo():
    return render_template("insertar.html")

@app.route("/guardar", methods=["POST"])
def guardar():
    persona = Persona(
        request.form.get("tipo_persona"),
        request.form.get("nombres"),
        request.form.get("apaterno"),
        request.form.get("amaterno"),
        request.form.get("razon_social"),
        request.form.get("nombre_comercial"),
        request.form.get("id_tipo_documento"),
        request.form.get("numero_documento"),
        request.form.get("telefono"),
        request.form.get("email"),
        request.form.get("id_nacionalidad"),
        request.form.get("estado")
    )
    insertar_persona(persona)
    return redirect("/")

@app.route("/buscar_dni", methods=["POST"])
def buscar_dni():
    # Nueva ruta para usar el procedimiento sp_buscar_persona_dni
    dni = request.form.get("dni_buscar")
    resultado = buscar_persona_dni(dni)
    # Aquí puedes redirigir a donde desees mostrar el resultado
    return redirect("/")

@app.route("/editar/<int:id>")
def editar(id):
    # Nota: Necesitarás un archivo editar.html en templates para que esto renderice
    persona = buscar_persona_dni(id) # Asumiendo que adaptas la búsqueda o creas buscar_por_id
    return render_template(
        "editar.html",
        persona=persona
    )

@app.route("/actualizar", methods=["POST"])
def actualizar():
    actualizar_persona(
        request.form["id"],
        request.form["nombres"],
        request.form["apaterno"],
        request.form["amaterno"],
        request.form["telefono"]
    )
    return redirect("/clientes")

@app.route("/eliminar/<int:id>")
def eliminar(id):
    eliminar_persona(id)
    return redirect("/clientes")

if __name__ == '__main__':
    app.run(debug=True)