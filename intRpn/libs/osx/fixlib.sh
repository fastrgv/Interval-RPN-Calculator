# apply this to several OSX library files
# to allow runtime linking on OSX
# when gaol-related libs are in ./libs/osx/

# use this for
# libgaol-4.2.1.dylib
# libgdtoa.0.dylib
# libultim-2.1.0.dylib
#
# libifgaol.dylib

install_name_tool -id "@rpath/$1" $1
