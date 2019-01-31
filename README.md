# openvino-docker
Openvino environment with docker

## Download OpenVINO Toolkit 

You can register and download it from : https://software.intel.com/en-us/openvino-toolkit/choose-download/free-download-linux

Or use wget to get the 2018 Release 5 directly

$ wget http://registrationcenter-download.intel.com/akdlm/irc_nas/15013/l_openvino_toolkit_p_2018.5.445.tgz

### Untar the file and locate it in the root folder  

$ tar -xf l_openvino_toolkit*

### Build docker

$ docekr build -t openvino . 

### Run docker

$ docker run -ti openvino /bin/bash 
