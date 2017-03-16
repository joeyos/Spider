import pytesseract
from PIL import Image
image = Image.open(‘vcode.gif’)
vcode = pytesseract.image_to_string(image)
print(vcode)
