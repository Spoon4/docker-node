#!/usr/bin/env bash

PUID="${PUID:-0}"
PGID="${PGID:-0}"

TEMP_FILE="pandoc-temp.html"

pandoc -s -f markdown_github -o $TEMP_FILE /source/*.md


pandoc -s $TEMP_FILE $*

FILENAME=$(echo $* | sed 's/.*\(-o\ \|--output=|--output\ \)\([[:graph:]]*\).*/\2/')
if [ -n "${FILENAME}" ] && [ -e "${FILENAME}" ]; then
	chown ${PUID}:${PGID} ${FILENAME}
fi

rm $TEMP_FILE
