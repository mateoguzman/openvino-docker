#!/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/inference_engine_demos_build/intel64/Release/lib/
source /opt/intel/openvino/bin/setupvars.sh && \
    /root/inference_engine_demos_build/intel64/Release/security_barrier_camera_demo \
    -d CPU \
    -d_va CPU \
    -d_lpr CPU \
    -i /opt/intel/openvino/deployment_tools/demo/car_1.bmp \
    -m /root/openvino_models/ir/intel/vehicle-license-plate-detection-barrier-0106/FP16/vehicle-license-plate-detection-barrier-0106.xml \
    -m_lpr /root/openvino_models/ir/intel/license-plate-recognition-barrier-0001/FP16/license-plate-recognition-barrier-0001.xml \
    -m_va /root/openvino_models/ir/intel/vehicle-attributes-recognition-barrier-0039/FP16/vehicle-attributes-recognition-barrier-0039.xml