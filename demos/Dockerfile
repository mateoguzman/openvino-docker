FROM openvino-dev:2020.2.130 as pedestrian-tracker-dev

#Install needed dependences
RUN apt-get update && apt-get -y upgrade && apt-get autoremove -y
RUN apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        ffmpeg \
        libgtk-3.0 \        
        python3 \
        python3-pip  \
        python3-setuptools && \
        apt autoremove -y && \
        rm -rf /var/lib/apt/lists/*

COPY pedestrian-tracker.sh /app/
COPY videos /app/videos

## Download needed models
WORKDIR /opt/intel/openvino/deployment_tools/open_model_zoo/tools/downloader/
RUN pip3 install -r requirements.in
RUN ./downloader.py --name person-detection-retail-0013 --output_dir /app/models
RUN ./downloader.py --name person-reidentification-retail-0031 --output_dir /app/models

# Build Open Model Zoo demos
RUN /opt/intel/openvino/deployment_tools/open_model_zoo/demos/build_demos.sh

CMD ["bash"]
