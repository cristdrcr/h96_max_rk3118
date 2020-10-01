#!/bin/sh
echo "HELPFUL NOTE: Exit Screen with CTRL^A then \\"
echo "Will Connect in 5 sec Good LUCK!!!!"
sleep 5
screen -L /dev/ttyUSB1 1500000,cs8,-parenb,-cstopb,-hupcl
