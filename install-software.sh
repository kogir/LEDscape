#!/usr/bin/env bash

function finish {
	popd
}
trap finish EXIT

pushd $(dirname $0)

echo "Making ledscape..."
make

if [[ -f "/etc/ledscape-config.json" ]]; then

	echo "Leaving existing /etc/ledscape-config.json intact"

else

	echo "Copying config file to /etc"
	sudo cp configs/ws281x-config.json /etc/ledscape-config.json

fi

echo "Done"
