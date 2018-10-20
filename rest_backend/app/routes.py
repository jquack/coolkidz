import json
import os
import uuid

from flask import request

from app import app
import read_img


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
    full_name = os.path.join(dirpath, "storage", f_name)
    file.save(full_name)
    res = read_img.image_recognize(full_name)
    print(res)
    return json.dumps({'filename': f_name, 'items': res})
