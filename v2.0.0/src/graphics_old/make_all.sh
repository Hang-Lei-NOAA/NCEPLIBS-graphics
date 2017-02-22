#!/bin/sh

cd ./gph
make
cp ./libgph*.a ..
cd ../gphcntr
make
cp ./libgph*.a ..
cd ../gphfont
make
cp ./libgph*.a ..
cd ../util
make
cp *.a ..
cd ../w3g
make
cp *.a ..
cd ..

