mkdir hpx
cd hpx
git clone https://github.com/STEllAR-GROUP/hpx.git --branch stable --single-branch
mkdir build-hpx && cd build-hpx
cmake ../hpx -DHPX_WITH_PARCELPORT_MPI=ON -DHPX_WITH_PARCELPORT_TCP=OFF -DCMAKE_BUILD_TYPE=DEBUG
make -j 8
make install
