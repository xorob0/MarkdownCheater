#! /bin/sh
#
# generate.sh
# Copyright (C) 2020 xorob0 <xorob0@posteo.net>
#
# Distributed under terms of the GPL license.
#
file='index.md'
output=''
convertOutput=''
papersize='a4'

parse_args() {
		case "$1" in
				-i)
					file="$2"
						;;
				-o)
						output="$2"
						;;
				-c)
						convertOutput="$2"
						;;
				--papersize)
						papersize="$2"
						;;
				*)
						echo "Unknown or badly placed parameter '$1'." 1>&2
						exit 1
						;;
		esac
}

while [ "$#" -ge 2 ]; do
		parse_args "$1" "$2"
		shift; shift
done

if [ -z "$output" ]; then
	output="${file%.*}.pdf"
fi

pandoc -t html5 -V margin-top=3 -V margin-left=3 -V margin-right=3 -V margin-bottom=3 -V papersize="$papersize" "$file" --css style.css -o "$output" --metadata pagetitle="${file%.*}"

if [ -n "$convertOutput" ]; then
	convert -trim "$output" "$convertOutput"
fi