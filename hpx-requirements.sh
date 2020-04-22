apt-get install -y libgoogle-perftools-dev 

mkdir hwloc
cd hwloc

tar -xzvf /home/myUser/hwloc-1.11.13.tar.gz -C /hwloc

cd hwloc-1.11.13
./configure
make -j 8 install
