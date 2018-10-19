from flask import Flask, request
import os
import uuid
import json 
app = Flask(__name__)

@app.route('/')
def helloworld():
    return "Hello world, 3.0"

@app.route('/upload', methods=['POST'])
def upload():
    file = request.files['image']
    print(file)
    extension = os.path.splitext(file.filename)[1]
    f_name = str(uuid.uuid4()) + extension
    dirpath = os.path.dirname(os.path.realpath(__file__))
    file.save(os.path.join(dirpath, "storage", f_name))
    return json.dumps({'filename':f_name})