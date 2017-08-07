# docker-esri
Dockerfiles for base centos, ags, portal, and postgres containers.  Draws heavily from the work of [Mansour](https://github.com/mraad/docker-arcgis) and many others in the Docker community.

## Requirements
* Download the installers for AGS and Portal (see https://my.esri.com/#/downloads)
* Get your provisioning file for AGS/Portal
* Install [virtualbox](https://www.virtualbox.org/wiki/Downloads)
* Install [docker](https://docs.docker.com/engine/installation/)
* If you're running on windows or OSX, install [docker-machine](https://docs.docker.com/machine/install-machine/) 

## Setup
The AGS, Portal, and PostGRES images are built off of a base CENTOS image, with a few extra dependencies.  On Windows or OSX machines, these images will run on top of a virtual machine running linux.

### Virtual Machine
* On Windows or OSX, your containers will run inside a virtual machine.  To set this up the first time, run `create-machine.sh`
* Run `docker-machine start arcgis`
* Run `docker-machine env arcgis --shell bash` (or `cmd`, or `powershell`)
* Run the output of the above command, i.e., 
```
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="C:\Users\<username>\.docker\machine\machines\arcgis"
export DOCKER_MACHINE_NAME="arcgis"
```

### Base Image
Run `base/build-image.sh`

### AGS Image
* Copy your AGS installer (i.e. `ArcGIS_for_Server_Linux_1041_151978.tar.gz`) to a local directory that you can use as the root of a webserver
* Spin up a [webserver](https://www.npmjs.com/package/local-web-server) pointed at the above directory
Copy your provisioning file to `ags/` (i.e. `EDN_AGSADVENT_Portal_20161010.prvc`)
* Edit the `ags/build-image.sh` script to point to your provisioning file and local webserver
* Run `ags/build-image.sh`
* Run `ags/run.sh`
* In your browser, navigate to the AGS manager on the VM ip address, i.e. `https://192.168.99.100:6443/arcgis/manager/`

### Portal Image
* Copy your Portal installer and provisioning file to `portal/` (i.e. `Portal_for_ArcGIS_Linux_1041_151999.tar.gz`  and `EDN_AGSADVENT_Portal_20161010.prvc`)
* Change the registration email in `ags/Dockerfile` to the appropriate email
* *Important*: There is a bug in the automatic installer, where it only reads a single entry from the provisioning file.  Open your .prvc file, and ensure that the first entry is for portal, i.e. `Portal for ArcGIS=ECP123456789`
* Run `portal/build-image.sh`
* Run `portal/run.sh`
* In your browser, navigate to the Portal admin on the VM ip address, i.e. `https://192.168.99.100:7443/arcgis/home`
* *Important*: It takes the Portal instance some time (~30 seconds) before it will begin accepting connections, even once the container is spun up.

