# author:fyf
# date:2023-11-02
# descript:...

#!/bin/bash
cd /sys/devices/platform/coretemp.0/hwmon/hwmon1 && \
cat temp1_input && cat temp2_input && cat temp3_input && cat temp4_input && cat temp5_input &&
sensors

