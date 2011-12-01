#!/bin/sh

./a.out < $1 2> test/output.debug;
echo "--------------------INPUT FILE---------------------";
echo " ";

cat $1;
