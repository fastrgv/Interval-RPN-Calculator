
# use this to ensure a complete recompilation:
if [ -d ./obj/ ]; then
	rm ./obj/*
else
	mkdir obj
fi




export PATH=$HOME/opt/GNAT/2018/bin:$PATH

gnatmake irpn \
-D $PWD/obj \
-I$PWD/. \
-largs -lm \
-Xlinker -rpath -Xlinker @loader_path/libs/osx \
$PWD/libs/osx/libultim.dylib \
$PWD/libs/osx/libgdtoa.dylib \
$PWD/libs/osx/libgaol.dylib \
$PWD/libs/osx/libifgaol.dylib

mv irpn irpn_osx

