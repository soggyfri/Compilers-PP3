#!/bin/sh

./a.out < $1 1> test/output.debug;
echo "--------------------INPUT FILE---------------------";
echo " ";

if [ -n "$2" ];
then
  mv test/latexout test/output/$2.output
  mv test/latextoc test/output/$2.toc.output
fi

#cat $1;
