This is the coolkidz Zone

# OCR-Splitter
## Quick description
This android app eases the process of money tracking between friends. You go to the supermarket with friends, buy a bunch of items, each pay for a part but the exact amount. What happens next? You now need to take each item on your receipt, determine who must pay how much for this item and sum everything (all while deducing what you already paid). With OCR-Splitter, you spend more time laughing with your friends than counting.

With our app, you can just snap a picture of the receipt, our OCR engine will automatically determine the name and price of each item (you can of course adjust in case of mistakes), you indicate who benefited for each item, and *voilà*! No more painful counting. 

And you can even share a board with your friends, so everyone can see and modify transactions

## How it works
when you snap a picture, you send it to our server where a bunch of image processing is applied to enhance the picture, and then we pass it through Tesseract 4, Google's OCR engine (don't worry, the pictures are not sent to Google's servers). A few algorithmic subtleties later, and we have an estimation of the items' name and price on your receipt.

As this technique is not perfect (because every receipt is different), we allow you to easily correct what we detected. And in case of doubt, you can always display the receipt and correct entries, whenever you want.

## How to obtain the best results
* Hold your phone directly above the receipt
* Keep a sufficient light source
* Once you've taken the picture, you can resize and rotate the picture. Try to minimize the picture to the items (and not other information), while rotating the text to be as horizontal as possible.

## How to have my own app/backend
### Backend
On your server (GNU/Linux), you need the following things:
* Python3
* Tesseract
* CV2 (opencv)
* Python libraries that are listed in `rest_backend/requirements.txt`

### Frontend
Mainly, you need to set up your app to communicate with your server, instead of ours. For that, change the IP address everywhere you see it appear.

## Warnings
Obviously, this software is provided as-is, with no guarantee (see `LICENSE.txt` for more details). Also, please note that we store the pictures you send for recognition (so your friends can also view the receipts).

Be also careful, because at the moment we are using simple HTTP, with little encryption/authentication means (yet! you can contribute). Everything you enter is potentially visible by a lot of people. So we advise you not to send private/confidential/sensitive data through our app.