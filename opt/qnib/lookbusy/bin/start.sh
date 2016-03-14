#!/usr/local/bin/dumb-init /bin/bash

if [ -z ${LOOKBUSY_CPU_MODE} ];then
    LOOKBUSY_CPU_MODE=fixed
fi
if [ -z ${LOOKBUSY_CPU_UTIL} ];then
    LOOKBUSY_CPU_UTIL=10
fi
lookbusy --cpu-mode=${LOOKBUSY_CPU_MODE} --cpu-util=${LOOKBUSY_CPU_UTIL}
sleep 1

PID=$(pgrep lookbusy)
if [ -z ${PID} ] ;then
    echo "No pid for lookbusy..."
    exit 1
fi
while [ -e /proc/${PID} ]; do 
    sleep 1
done

exit 0
