mkdir boost
cd boost

tar -xzvf /home/myUser/boost_1_72_0.tar.gz -C /boost

export CXXFLAGS="-std=c++11 -O3 -DNDEBUG -fopenmp"

cd boost_1_72_0
./bootstrap.sh
./b2 -j8 toolset=gcc cxxflags="-std=c++11 -O3 -DNDEBUG -fopenmp" install

