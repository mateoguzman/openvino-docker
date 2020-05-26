#!/bin/bash

VIDEO="${VIDEO:-/app/videos/store.mp4}"

source /opt/intel/openvino/bin/setupvars.sh && \
    /root/omz_demos_build/intel64/Release/pedestrian_tracker_demo \
  -i $VIDEO \
  -m_det /app/models/intel/person-detection-retail-0013/FP32/person-detection-retail-0013.xml \
  -m_reid /app/models/intel/person-reidentification-retail-0031/FP32/person-reidentification-retail-0031.xml  \
  -d_det CPU
