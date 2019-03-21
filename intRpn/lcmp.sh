
# use this to ensure a complete recompilation:
if [ -d ./obj/ ]; then
	rm ./obj/*
else
	mkdir obj
fi




export PATH=$HOME/opt/GNAT/2018/bin:$PATH

gnatmake irpn \
-D obj \
-I$PWD/. \
-largs \
-Xlinker -rpath='$ORIGIN/libs/gnu' \
-L$PWD/libs/gnu \
-lm -lultim -lgdtoa -lgaol \
-lifgaol

mv irpn irpn_gnu

