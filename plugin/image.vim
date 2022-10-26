command! -nargs=0 Image call DisplayImage()
au BufRead *.png,*.jpg,*.jpeg :call DisplayImage()

function! DisplayImage()
set nowrap
python << EOF
from __future__ import division
import vim
from PIL import Image

def getAsciiImage(imageFile, maxWidth, maxHeight):
    try:
        img = Image.open(imageFile)
    except:
        exit("Cannot open image %s" % imageFile)

    # We want to stretch the image a little wide to compensate for
    # the rectangular/taller shape of fonts.
    # The width:height ratio will be 2:1
    width, height = img.size
    width = width * 2

    scale = maxWidth / width
    imageAspectRatio = width / height
    winAspectRatio = maxWidth / maxHeight

    if winAspectRatio > imageAspectRatio:
        scale = scale * (imageAspectRatio / winAspectRatio)

    scaledWidth = int(scale * width)
    scaledHeight = int(scale * height)

    # Use the original image size to scale the image
    img = img.resize((scaledWidth, scaledHeight))
    pixels = img.load()

    colorPalette = "@%#*+=-:. "
    lencolor = len(colorPalette)

    # Delete the current buffer so that we dont overwrite the real image file
    vim.command("bd!")
    # get a new buffer
    # enew is safe enough since we did not specified a buftype, so we
    # cannot save this
    vim.command("enew")

    # clear the buffer
    vim.current.buffer[:] = None

    for y in xrange(scaledHeight):
        asciiImage = ""
        for x in xrange(scaledWidth):
            rgb = pixels[x, y]
            if not isinstance(rgb, tuple):
                rgb = (rgb,)
            asciiImage += colorPalette[int(sum(rgb) / len(rgb) / 256 * lencolor)]
        vim.current.buffer.append(asciiImage)

    return asciiImage
    
vim.command("let imagefile = expand('%:p')")
imagefile = vim.eval("imagefile")

width = vim.current.window.width
height = vim.current.window.height

getAsciiImage(imagefile, width, height)

EOF
endfunction
