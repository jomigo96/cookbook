# Remove all metadata, then resize to 300dpi
# You may need to first crop it

DPI=300
WIDTH_CM=7
WIDTH_PX=$(echo "scale = 0; ($DPI * $WIDTH_CM * 0.393701)/1" | bc -l)

exiftool -all= -overwrite_original $1
magick $1 -density "$DPI" -units PixelsPerInch -resize "$WIDTH_PX"x $1
