#!/bin/bash
set -ex

CONFIG_DIR=${SYNCTHING_DATA}/config
CONFIG_XML=${CONFIG_DIR}/config.xml
BINARY=${SYNCTHING_HOME}/syncthing/syncthing

if [ ! -f ${CONFIG_XML} ]
then
  echo "generating config"
  ${BINARY} --generate="${CONFIG_DIR}"
fi

cp ${CONFIG_XML} ${CONFIG_XML}.old
cat ${CONFIG_XML} \
	| xmlstarlet ed \
    	-u '/configuration/gui/address' \
		-v '0.0.0.0:8384' \
	> ${CONFIG_XML}.new
rm ${CONFIG_XML}
mv ${CONFIG_XML}.new ${CONFIG_XML}

mkdir -p ${SYNCTHING_DATA}/files

${BINARY} -home="${CONFIG_DIR}"
