

# this is newest compiler 2018 from AdaCore:
export PATH=$HOME/opt/GNAT/2018/bin:$PATH

g++ -c -fdump-ada-spec -C ifGAOL.hpp

mv ifgaol_hpp.ads ..

