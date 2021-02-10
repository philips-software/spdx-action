#!/bin/bash -lx

echo "--------------------------------------------------------------------"
echo " Creating SPDX file for ${PROJECT}. "
echo "--------------------------------------------------------------------"
echo " Inputs: "
echo "    PROJECT    : ${PROJECT} "
echo "    SCANNER_URL: ${SCANNER_URL} "
echo "--------------------------------------------------------------------"

java -jar spdx-builder.jar -c .spdx-builder.yml -o ${PROJECT}.spdx ort/analyzer-result.json

echo "--------------------------------------------------------------------"
echo "Finished!"
echo "--------------------------------------------------------------------"

echo "::set-output name=spdx-file::${PROJECT}.spdx"
