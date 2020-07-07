#!/bin/bash

VIDEO="${VIDEO:-/app/videos/video.mp4}"

source /opt/intel/openvino/bin/setupvars.sh && \
 python3  /opt/intel/openvino/inference_engine/demos/python_demos/face_recognition_demo/face_recognition_demo.py \
  -i $VIDEO \
  -fg /app/images \
  -m_fd /app/models/intel/face-detection-adas-0001/FP32/face-detection-adas-0001.xml \
  -m_lm /app/models/intel/landmarks-regression-retail-0009/FP32/landmarks-regression-retail-0009.xml \
  -m_reid /app/models/intel/face-reidentification-retail-0095/FP32/face-reidentification-retail-0095.xml 

