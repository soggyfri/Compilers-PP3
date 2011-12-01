#!/bin/sh

./a.out < $1 1> test/output.debug;
echo "--------------------INPUT FILE---------------------";
echo " ";

#cat $1;
