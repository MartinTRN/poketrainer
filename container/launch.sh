#!/usr/bin/env bash

set -u

if [ ! -f /config.json ]; then
	echo "No config.json specified; please mount it to docker container via: "
	echo "	docker run -ti -v \$(pwd)/config.json:/config.json pokecli -i <id>"
	exit 1
fi

sed -i "s/userMail/${username}/g" /config.json
sed -i "s/userPassword/${password}/g" /config.json
sed -i "s/userLocation/${location}/g" /config.json
sed -i "s/userApiKey/${apiKey}/g" /config.json

python web.py &
python pokecli.py -e EncryptLibrary/libencrypt.so
