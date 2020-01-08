mkdir hpx
cd hpx
git clone https://github.com/STEllAR-GROUP/hpx.git --branch 1.3.0 --single-branch
mkdir build-hpx && cd build-hpx
cmake ../hpx
make -j 8
make install
