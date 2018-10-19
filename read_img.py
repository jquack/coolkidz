import pytesseract
from PIL import Image

def image_recognize(inputpath, outputpath):
    image = Image.open(inputpath)
    text = pytesseract.image_to_string(image)
    print(text)
    f = open(outputpath, "w+")
    f.write(str(text))
    f.close()
