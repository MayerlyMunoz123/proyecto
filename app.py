from flask import Flask, render_template, request, redirect,jsonify
from psycopg2 import connect, extras

app = Flask(__name__)

# Datos para la conexión a la base de datos
host = "localhost"
port = 5432
username = "postgres"
password = "1602"
dbname = "latratoria"

# Función para la conexión a la base de datos
def connect_database():
    conn = connect(host=host, port=port, user=username, password=password, dbname=dbname)
    return conn

# Ruta raíz - página de inicio
@app.route("/")
def home():
    return render_template("index.html")
# Ruta reserva


# Ruta para el ingreso del administrador
@app.route("/administrador", methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if username == "latratoria" and password == "1234":
            return redirect('/registro')
        else:
            return render_template("login.html", mostrar_error=True)
    else:
        return render_template('login.html', mostrar_error=False)

# Ruta para el listado de registros
@app.route("/registro", methods=['GET'])
def registros():
    conn = connect_database()
    cursor = conn.cursor(cursor_factory = extras.RealDictCursor)
    cursor.execute("SELECT c.nombre, c.apellido, c.idcedula, c.telefono, a.nombreambiente, r.idreserva, r.cantidadepersonas FROM comensales c, reservas r, ambientes a WHERE a.idambiente = r.idambiente AND c.idcedula = r.idcedula")
    datos = cursor.fetchall()
    conn.close()
    cursor.close()
    print(datos)
    return render_template("registro.html", datos=datos)

@app.route("/formulario", methods=["GET"])
#Funcion para plasmar ambientes en la tabla de formulario
def ambientes():
    conn = connect_database()
    cursor= conn.cursor(cursor_factory=extras.RealDictCursor)
    cursor.execute("SELECT idambiente, descripcion, nombreambiente FROM ambientes")
    ambientes=cursor.fetchall()
    conn.close()
    cursor.close()
    print(ambientes)
    return render_template("formulario.html", ambientes=ambientes)
#Ruta para acceder a la reserva
@app.route("/formulario", methods=["GET","POST"])
def reservar():
    return render_template("formulario.html")

#Metodo para eliminar una reserva 
@app.route("/<int:idreserva>/delete", methods=["GET", "POST"])
def eliminar_reserva(idreserva):
    conn=connect_database()
    cursor=conn.cursor(cursor_factory=extras.RealDictCursor)
    cursor.execute("Delete from reservas where idreserva=%s RETURNING *",(idreserva,))
    eliminar=cursor.fetchone()
    if request.method == "POST":
        if eliminar:
            conn.commit()
            cursor.close()
            conn.close()
            return redirect("/registro")
    return render_template("delete.html")

if __name__ == "__main__":
    app.run(debug=True)

