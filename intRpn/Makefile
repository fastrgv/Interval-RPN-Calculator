CC=gnatmake

irpn_osx: ifgaol_hpp.ads irpn.adb mathtypes.ads
	mkdir -p obj
	$(CC) irpn -D $(CURDIR)/obj -I$(CURDIR) -largs -lm -Xlinker -rpath -Xlinker @loader_path/libs/osx $(CURDIR)/libs/osx/libultim.dylib $(CURDIR)/libs/osx/libgdtoa.dylib $(CURDIR)/libs/osx/libgaol.dylib $(CURDIR)/libs/osx/libifgaol.dylib
	mv irpn $@

irpn_gnu: ifgaol_hpp.ads irpn.adb mathtypes.ads
	mkdir -p obj
	$(CC) irpn -D obj -I$(CURDIR) -largs -Xlinker -rpath='$(CURDIR)/libs/gnu' -L$(CURDIR)/libs/gnu -lm -lultim -lgdtoa -lgaol -lifgaol
	mv irpn irpn_gnu

.PHONY : clean

clean:  -rm -Rf irpn_osx irpn_gnu obj 
