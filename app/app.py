from flask import Flask, request

app = Flask(__name__)

@app.route('/financing-interface/hello')
def hello_world():
    message = "I'm with path financing-interface"
    headers = "\n".join(f"{key}: {value}" for key, value in request.headers.items())
    return f"{message}\n\nRequest Headers:\n{headers}"

@app.route('/financing/hello')
def hello():
    message = "I'm with path financing"
    headers = "\n".join(f"{key}: {value}" for key, value in request.headers.items())
    return f"{message}\n\nRequest Headers:\n{headers}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)