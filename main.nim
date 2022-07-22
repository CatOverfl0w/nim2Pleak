import steganography, pixie

proc encodeImg(img: string, msg: string) =
    var image = readImage(img)
    encodeMessage(image, msg)
    image.writeFile(img)
    let file = open("TonMessage.txt", fmWrite)
    defer: file.close()
    file.writeLine(msg)
    doAssert decodeMessage(image) == msg # Cette ligne permet de verifier si le message est bien cacher dans l'image

echo "Nom de l'image que vous voulez envoyer: \n"
var imageName: string = readLine(stdin)
echo "Message que vous voulez cacher pour reconnaitre la personne qui leak l'image"
var messageName: string = readLine(stdin)

try:
    encodeImg(imageName, messageName)
except:
    echo "Le fichier n'existe pas et/ou erreur inconnue"