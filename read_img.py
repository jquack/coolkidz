import pytesseract
from PIL import Image

def image_recognize(inputpath, outputpath):
    image = Image.open(inputpath)
    text = pytesseract.image_to_string(image)
    items_list = []
    for row in text.split("\n"):
        item = []
        price = None
        for word in row.split(" "):
            try:
                price = float(word.replace(",","."))
                # print("Found a price: {}".format(price))
            except ValueError:
                item += [word]
        if price:
            items_list += [(" ".join(item), price)]
    # print(items_list)
    # f = open(outputpath, "w+")
    # f.write(str(items_list))
    # f.close()
    return items_list

def main():
    image_recognize("bills/bill1.jpg", "bills/recognized.txt")

if __name__ == "__main__":
    main()