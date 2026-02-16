#!/bin/sh

fn="$1"
W="$2"
H="$3"

imagepv() {
    #chafa -f symbols -s "$2"x"$3" --animate off --polite on -t 1 --bg black "$1"
    chafa -f sixel -s "$2"x"$3" --animate off --polite on --bg 282c34  -t 1 -c full "$1"
}


#echo "W=$W H=$H" >> ~/pv.log

#echo "previewing file W=$W H=$H" >> ~/pv.log

mime="$(get_mime "$fn")"
case "$mime" in
        application/gzip) compress.sh -l "$fn";;
        application/zip) compress.sh -l "$fn";;
        application/*rar) compress.sh -l "$fn";;
        application/x-7z-compressed) compress.sh -l "$fn";;
        image/*) imagepv "$fn" "$W" "$H";;
        video/*) ffmpegthumbnailer -s 0 -i "$fn" -c jpeg -o - | imagepv - "$2" "$3";; 
        application/pdf) pdftotext "$fn" -;;
        *) bat -f "$fn";; #*) highlight -O ansi "$1" || cat "$1";;
esac

#exit 0
