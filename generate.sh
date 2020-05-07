#! /bin/sh
#
# generate.sh
# Copyright (C) 2020 xorob0 <xorob0@posteo.net>
#
# Distributed under terms of the GPL license.
#

file=$1
filename="${file%.*}"

pandoc -t html "$file" --css style.css -o "$filename.pdf" --metadata pagetitle="$filename"