
# this is newest compiler 2018 from AdaCore:
export PATH=$HOME/opt/GNAT/2018/bin:$PATH



g++ ifGAOL.cpp -c \
-fPIC \
-I$PWD/include

g++ -shared -o libifgaol.so ifGAOL.o \
-L$PWD/../libs/gnu \
-lm -lultim -lgdtoa -lgaol

rm ifGAOL.o
mv libifgaol.so ../libs/gnu/


