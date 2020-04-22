mkdir hpx
cd hpx
git clone https://github.com/STEllAR-GROUP/hpx.git --branch 1.4.1 --single-branch
#rm /hpx/hpx/src/util/batch_environments/slurm_environment.cpp
#cp /home/myUser/slurm_environment.cpp /hpx/hpx/src/util/batch_environments/slurm_environment.cpp
mkdir build-hpx && cd build-hpx

export OMPI_DIR=/opt/ompi
export PATH=$OMPI_DIR/bin:$PATH
export LD_LIBRARY_PATH=$OMPI_DIR/lib:$LD_LIBRARY_PATH
export MANPATH=$OMPI_DIR/share/man:$MANPATH

cmake ../hpx -DHPX_WITH_EXAMPLES=ON -DHPX_WITH_PARCELPORT_MPI=ON -DHPX_WITH_PARCELPORT_TCP=OFF -DCMAKE_CXX_FLAGS="-std=c++11 -O3 -DNDEBUG -fopenmp" -DHPX_WITH_CXX17_FILESYSTEM=OFF -DHPX_FILESYSTEM_WITH_BOOST_FILESYSTEM_COMPATIBILITY=ON
make -j 8
make install

cd ..
mkdir build-hpx-apex && cd build-hpx-apex

cmake ../hpx -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/home/myUser/HPX_APEX -DHPX_WITH_EXAMPLES=OFF -DHPX_WITH_APEX=ON -DHPX_WITH_PARCELPORT_MPI=ON -DHPX_WITH_PARCELPORT_TCP=OFF -DCMAKE_CXX_FLAGS="-std=c++11 -O3 -DNDEBUG -fopenmp" -DHPX_WITH_CXX17_FILESYSTEM=OFF -DHPX_FILESYSTEM_WITH_BOOST_FILESYSTEM_COMPATIBILITY=ON
make -j 8
make install
