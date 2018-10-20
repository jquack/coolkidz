from flask import Flask, request
import os
import pytesseract
from PIL import Image
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
    full_name = os.path.join(dirpath, "storage", f_name)
    file.save(full_name)
    res = image_recognize(full_name)
    return json.dumps({'filename':f_name, 'items': res})


def image_recognize(inputpath):
    image = Image.open(inputpath)
    text = pytesseract.image_to_string(image)
    items_list = []
    for row in text.split("\n"):
        item = []
        price = None
        for word in row.split(" "):
            try:
                price = float(word.replace(",","."))
            except ValueError:
                item += [word]
        if price:
            items_list += [(" ".join(item), price)]
    return items_list
