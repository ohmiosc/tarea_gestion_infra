from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return ' Hola desde la imagen Docker creada con Terraform para trabajo final hectorcuadros!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)