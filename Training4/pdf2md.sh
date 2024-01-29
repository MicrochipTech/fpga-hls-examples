# To convert from PDF -> md
pandoc \
    -f docx \
    -t markdown \
    -t gfm \
    --standalone \
    --extract-media=./ \
    ./SmartHLS_PolarFire_SoC_Training.docx \
    -o readme.md

# To convert from md -> PDF
#pandoc readme.md -o output.pdf --table-of-contents
