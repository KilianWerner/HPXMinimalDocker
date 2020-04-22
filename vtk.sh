mkdir VTK
cd VTK

tar -xzvf /home/myUser/VTK-7.1.1.tar.gz -C /VTK

mkdir build
cd build
cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=RELEASE -DVTK_RENDERING_BACKEND=None -DVTK_GROUP_RENDERING=OFF ../VTK-7.1.1

make -j8 install

