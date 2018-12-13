from PIL import Image

sourceIMG = Image.open("img.png")

newImgSize=200

ASCII_CHARS = ['.',',',':',';','+','*','?','%','S','#','@']
ASCII_CHARS = ASCII_CHARS[::-1]

# resize the image so that it doesn't look so portrait when printed

# make a list of ascii characters from the pixel data
# img.resize((100,100))

#Resize Image
def resize(img, newSize):
    resizeIMG = img.resize((newSize,newSize))
    return resizeIMG

#get pixel data
def getPixelData():
    pixels = list(sourceIMG.getdata())
    # print(pixels)
    return pixels

#convert pixel data to ascii characters

# To print on console
print(asImage)
