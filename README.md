## Installation ##

* Make sure Docker is installed on the remote computer
* Install pv on your local computer:  
`sudo apt install pv` on Linux or `brew install pv` on Mac

* Install this tool on your local computer by downloading it to a directory on your $PATH and make it executable:
```
wget https://raw.githubusercontent.com/MorbZ/docker-volume-transfer/master/docker-volume-transfer.sh -O /usr/local/bin/docker-volume-transfer
chmod +x /usr/local/bin/docker-volume-transfer
```

## Usage ##
### Download Volume ###
Syntax:  
`docker-volume-transfer <ssh-command> <volume-name>`

Example:  
`docker-volume-transfer root@myserver.de mydockervolume`

This will create the file `mydockervolume.tgz` in your current working directory that contains the compressed contents of the Docker volume `mydockervolume`. If the volume doesn't exist on the server an empty .tgz file will be created.

### Upload Volume ###
Syntax:  
`docker-volume-transfer <ssh-command> <volume-name> <tar-file>`

Example:  
`docker-volume-transfer root@myserver.de mydockervolume mydockervolume.tgz`

If the volume doesn't exist on the server it will be created. If the volume already exists files will be overridden.