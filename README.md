# openvino-docker
Intel® OpenVINO™ Toolkit environment

This Dockerfile will provide you with a base environment to run your inference models with OpenVINO™.  

## Building the Docker Image

### Download Intel® OpenVINO™ Toolkit 

The firt thing you need is to download the OpenVINO(tm) toolkit.

You can register and download it from the following link (Linux version): 
[https://software.intel.com/en-us/openvino-toolkit/choose-download/free-download-linux](https://software.intel.com/en-us/openvino-toolkit/choose-download/free-download-linux)

Or use wget to get the package directly (Latest version is 2018 R5.1 by the time writing this guide)

```
$ wget http://registrationcenter-download.intel.com/akdlm/irc_nas/15078/l_openvino_toolkit_p_2018.5.455.tgz
```

### Extract the file in the root folder  

```
$ tar -xf l_openvino_toolkit*
```

### Build the image

```
$ docker build -t openvino . 
```

## Using the image 

### Run a container

You can directly run a container based on this image or use this image across other images. 

To run a container based on this image: 

```
$ docker run -ti openvino /bin/bash
```

### Use the image in another container

You can use this Docker image as a base image and use it in multiple Dockerfiles. An example of how to do this has been provided: 

Move to sample-app directory and build the image
```
$ cd sample-app
$ docker build -t openvino-app . 
```

### Run the the container with X enabled (Linux)

Additionally, for running a sample application that displays an image, you need to share the host display to be accessed from guest Docker container. 

The following flags needs to be added to the docker run command: 

 * --net=host
 * --env="DISPLAY"
 * --volume="$HOME/.Xauthority:/root/.Xauthority:rw"
 
To run the docker-app image with the display enabled: 

```
$ docker run --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -ti docker-app /bin/bash
```

### Run two demos

Once inside the container, go to the Inference Engine demo directory:

```
$ cd /opt/intel/computer_vision_sdk/deployment_tools/demo
```
Run the Image Classification demo:

```
$ ./demo_squeezenet_download_convert_run.sh
```

Run the inference pipeline demo:
```
$ ./demo_security_barrier_camera.sh
```
