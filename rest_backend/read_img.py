import pytesseract
from PIL import Image
import cv2




def image_recognize(inputpath):
    # image = Image.open(inputpath)

    image = cv2.imread(inputpath, cv2.CV_8UC1)
    image = image_correction(image)


    text = pytesseract.image_to_string(image)
    # print(text)
    items_list = []
    for row in text.split("\n"):
        item = []
        price = None
        for word in row.split(" "):
            try:
                price = float(word.replace(",", "."))
            except ValueError:
                item += [word]
        if price and item:
            items_list += [(" ".join(item), price)]
    # print(items_list)
    return items_list

def image_correction(img):

    blur = cv2.medianBlur(img,5)
    ret3,img_corr= cv2.threshold(blur,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)
    # cv2.imwrite('img_corrected.png',img_corr)

    return img_corr

def main():
    image_recognize("bills/bill5.jpg")


if __name__ == "__main__":
    main()
