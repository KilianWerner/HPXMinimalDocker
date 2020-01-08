cmake_minimum_required(VERSION 3.3)
project(hpxmin CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(HPX_IGNORE_COMPILER_COMPATIBILITY ON)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

find_package(HPX REQUIRED)

include_directories(${HPX_INCLUDE_DIR})

add_hpx_executable(hpxmin
    ESSENTIAL
    SOURCES main.cpp 
)


