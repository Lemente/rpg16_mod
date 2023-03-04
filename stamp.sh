#!/bin/bash

# Set the directories to output to
if [ -z "${EXPORT_DIR}" ]; then
    EXPORT_DIR=build
fi
if [ -z "${TMP_DIR}" ]; then
    TMP_DIR=tmp
fi

if [ -z "$1" ]; then
    echo "Error: Missing tag to stamp"
    exit 1
fi

# Stamp the provided version number on the screenshot
convert "${EXPORT_DIR}/screenshot.png" \
    -gravity southeast -fill "#b9b5c5" -font "DejaVu-Serif" -annotate +0+1 "${1}"\
    -gravity southeast -fill "#696b7f" -font "DejaVu-Serif" -annotate -1-0 "${1}"\
    -gravity southeast -fill "#b9b5c5" -font "DejaVu-Serif" -annotate 0 "${1}"\
    "${EXPORT_DIR}/screenshot.png" || { echo "Failed to stamp versioning info onto ${EXPORT_DIR}/screenshot.png"; exit 1; }

# Stamp the provided version number into the texture_pack.conf
echo "release = ${1}" >> "${EXPORT_DIR}/texture_pack.conf"
