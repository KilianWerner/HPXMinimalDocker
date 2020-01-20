mkdir hpx
cd hpx
git clone https://github.com/STEllAR-GROUP/hpx.git --branch 1.3.0 --single-branch
rm /hpx/hpx/src/util/batch_environments/slurm_environment.cpp
cp /home/myUser/slurm_environment.cpp /hpx/hpx/src/util/batch_environments/slurm_environment.cpp
mkdir build-hpx && cd build-hpx
cmake ../hpx -DHPX_WITH_EXAMPLES=ON -DHPX_WITH_PARCELPORT_MPI=ON -DHPX_WITH_PARCELPORT_TCP=OFF -DCMAKE_BUILD_TYPE=DEBUG
make -j 8
make install
