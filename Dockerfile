FROM ubuntu:18.04

ARG PACKAGE=intel-openvino-dev-ubuntu18-2021.1.110

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends \
  ca-certificates \
  gnupg \
  wget 

RUN wget  https://apt.repos.intel.com/openvino/2021/GPG-PUB-KEY-INTEL-OPENVINO-2021 && \
  apt-key add GPG-PUB-KEY-INTEL-OPENVINO-2021

RUN echo "deb https://apt.repos.intel.com/openvino/2021 all main" > /etc/apt/sources.list.d/intel-openvino-2021.list

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  $PACKAGE && \
  apt autoremove -y && \
  rm -rf /var/lib/apt/lists/*

RUN /bin/bash -c "source /opt/intel/openvino_2021/bin/setupvars.sh"

RUN echo "source /opt/intel/openvino_2021/bin/setupvars.sh" >> /root/.bashrc

CMD ["/bin/bash"]
