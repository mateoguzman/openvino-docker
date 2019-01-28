FROM ubuntu:16.04

ADD . /openvino

ARG INSTALL_DIR=/opt/intel/computer_vision_sdk

RUN apt-get update && apt-get -y upgrade && apt-get autoremove

#Install needed dependences
RUN apt-get install -y --no-install-recommends \
        build-essential \
        cpio \
        curl \
        git \
        lsb-release \
        pciutils \
        python3.5 \
        python3.5-dev \
        python3-pip \
        python3-setuptools \
        sudo

# installing OpenVINO dependencies
RUN cd /openvino/l_openvino_toolkit* && \
    ./install_cv_sdk_dependencies.sh

RUN pip3 install numpy

# installing OpenVINO itself
RUN cd /openvino/l_openvino_toolkit* && \
    sed -i 's/decline/accept/g' silent.cfg && \
    ./install.sh --silent silent.cfg

# clean up 
RUN apt autoremove -y && \
    rm -rf /openvino /var/lib/apt/lists/*

RUN /bin/bash -c "source $INSTALL_DIR/bin/setupvars.sh"

RUN echo "source $INSTALL_DIR/bin/setupvars.sh" >> /root/.bashrc

CMD ["/bin/bash"]
