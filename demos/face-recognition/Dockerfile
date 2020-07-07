FROM openvino-dev:2020.3.194

#Install needed dependences
RUN apt-get update && apt-get install -y --no-install-recommends \
        gstreamer1.0-plugins-base \
        gstreamer1.0-plugins-good \
        gstreamer1.0-plugins-bad \
        ffmpeg \
        libgtk-3.0 \ 
        libpython3.6 \       
        python3 \
        python3-pip  \
        python3-setuptools \
        vim && \
        apt autoremove -y && \
        rm -rf /var/lib/apt/lists/*

COPY face-recognition.sh /app/

## Download needed models
WORKDIR /opt/intel/openvino/deployment_tools/open_model_zoo/tools/downloader/
RUN pip3 install -r requirements.in
RUN ./downloader.py --name face-detection-adas-0001 --output_dir /app/models
RUN ./downloader.py --name face-detection-adas-binary-0001 --output_dir /app/models
RUN ./downloader.py --name face-detection-retail-0004 --output_dir /app/models
RUN ./downloader.py --name face-reidentification-retail-0095 --output_dir /app/models
RUN ./downloader.py --name landmarks-regression-retail-0009 --output_dir /app/models

# Install face recognition python dependencies

RUN pip3 install -r /opt/intel/openvino/inference_engine/demos/python_demos/face_recognition_demo/requirements.txt

WORKDIR /app

CMD ["bash"]
