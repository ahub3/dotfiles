#!/bin/sh
#


fn="$1"
W="$2"
H="$3"
#W=50
#H=50


#echo "W=$W H=$H" >> ~/pv.log

#echo "previewing file W=$W H=$H" >> ~/pv.log

mime="$(get_mime "$fn")"
case "$mime" in
        application/gzip) compress.sh -l "$fn";;
        application/zip) compress.sh -l "$fn";;
        application/*rar) compress.sh -l "$fn";;
        application/x-7z-compressed) compress.sh -l "$fn";;
        image/*) 
            #chafa -f symbols -s "$W"x"$H" --animate off --polite on -t 1 --bg black "$1"
            chafa -f sixel -s "$W"x"$H" --animate off --polite on "$1"
            ;;
        video/*) ffmpegthumbnailer -s 0 -i "$fn" -c jpeg -o - | chafa -f sixel -s "$W"x"$H" --animate off --polite on -;; 
        application/pdf) pdftotext "$fn" -;;
        *) bat -f "$fn";; #*) highlight -O ansi "$1" || cat "$1";;
esac

#exit 0
