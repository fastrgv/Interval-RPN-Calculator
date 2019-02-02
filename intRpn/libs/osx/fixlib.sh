# either line works...perhaps 2nd is preferred:

#install_name_tool -id "@loader_path/libs/osx/$1" $1

install_name_tool -id "@rpath/$1" $1

