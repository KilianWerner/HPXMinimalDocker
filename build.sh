apt install -y libglm-dev

cd MinimalExample
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=DEBUG ..
make
