

g++ ifGAOL.cpp -c \
-fPIC \
-I$PWD/include


g++ -shared -o libifgaol.dylib ifGAOL.o \
-Xlinker -rpath -Xlinker @loader_path/libs/osx \
-L$PWD/../libs/osx \
-lm -lultim -lgdtoa -lgaol

rm ifGAOL.o
mv libifgaol.dylib ../libs/osx/



