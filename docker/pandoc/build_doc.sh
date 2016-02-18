#!/usr/bin/env bash

PUID="${PUID:-0}"
PGID="${PGID:-0}"

TEMP_FILE=temp.html
# INPUT=""
# 
# while read line
# do
#     echo -e "$INPUT"
#     $INPUT="$INPUT/source/$line "
# done < /files.txt
#
# pandoc -s -f markdown_github -o $TEMP_FILE $INPUT
pandoc -s -f markdown_github -o $TEMP_FILE /source/*.md

pandoc -s $TEMP_FILE $*

FILENAME=$(echo $* | sed 's/.*\(-o\ \|--output=|--output\ \)\([[:graph:]]*\).*/\2/')
if [ -n "${FILENAME}" ] && [ -e "${FILENAME}" ]; then
	chown ${PUID}:${PGID} ${FILENAME}
fi

rm $TEMP_FILE
