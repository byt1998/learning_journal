from flask import Flask, request, jsonify

app = Flask(__name__)
nama = "Enggar"

@app.route("/")
def hello_world():
    return f"<p>Hello {nama}!</p>"

@app.route("/ganti", methods=['POST'])
def ganti_nama():
    content = request.json
    nama = content['nama']
    response = jsonify(success=True, message=f"Nama sudah diganti menjadi {nama}") 

app.run(debug=True)