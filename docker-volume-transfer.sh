#!/bin/bash
if [ -z "$1" ] ; then
    echo "No remote host given"
	exit 1
fi
ssh=$1

if [ -z "$2" ] ; then
    echo "No docker volume given"
	exit 1
fi
volume=$2

if [ -z "$3" ] ; then
	# Download
	ssh $ssh "docker volume inspect $volume > /dev/null && cd \`docker volume inspect --format '{{ .Mountpoint }}' $volume\` && tar cz ." | pv > "$volume.tgz"
else
	# Upload
	file=$3
	pv $file | ssh $ssh "docker volume create $volume && cat | tar xz -C \`docker volume inspect --format '{{ .Mountpoint }}' $volume\`"
fi
