FROM ubuntu:16.04

ADD . /app
WORKDIR /app

# Support proxy 
ENV http_proxy http://proxy-us.intel.com:911
ENV https_proxy http://proxy-us.intel.com:911
ARG INSTALLER_DIR=/opt/intel/computer_vision_sdk

RUN apt-get update && apt-get -y upgrade && apt-get autoremove

#Pick up some TF dependencies
RUN apt-get install -y --no-install-recommends \
        build-essential \
        cpio \
        curl \
        git \
        lsb-release \
        pciutils \
        python3.5 \
        python3-pip \
        sudo 

# installing OpenVINO dependencies
RUN cd /app/l_openvino_toolkit* && \
    ./install_cv_sdk_dependencies.sh

## installing OpenVINO itself
RUN cd /app/l_openvino_toolkit* && \
    sed -i 's/decline/accept/g' silent.cfg && \
    /install.sh --silent silent.cfg

RUN /bin/bash -c source "$INSTALL_DIR/bin/setupvars.sh"

CMD ["/bin/bash"]
