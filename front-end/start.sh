#!/bin/bash

PROVIDER_SOCKET=${PROVIDER_SOCKET:-127.0.0.0:9944}
ENVIROMENT=${ENVIROMENT:-"dev"}
CONFIG_PATH=/substrate/src/config/
if [ ${ENVIROMENT} = "dev" ];
then
    CONFIG_FILE=development.json
elif [ ${ENVIROMENT} = "pro" ];
then
    CONFIG_FILE=production.json
else
    CONFIG_FILE=test.json
fi
cat << EOF > ${CONFIG_PATH}/${CONFIG_FILE}
{
  "PROVIDER_SOCKET": "${PROVIDER_SOCKET}"
}
EOF

cd /substrate
yarn run $1