# To convert from docx -> md
pandoc \
    -f docx \
    -t markdown \
    -t gfm \
    --standalone \
    --extract-media=./ \
    ./SmartHLS_PolarFire_SoC_Training.docx \
    -o readme.md

# To convert from md -> PDF
# We tried using pandoc in the following way:
#pandoc readme.md -o output.pdf --table-of-contents
# Which didn't work because of the latex formula.

# THIS IS WHAT WE USED TO GENERATE THE PDF
# VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=yzane.markdown-pdf

