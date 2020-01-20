cmake_minimum_required(VERSION 3.3)
project(hpxct CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(HPX_IGNORE_COMPILER_COMPATIBILITY ON)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

find_package(HPX REQUIRED)

include_directories(${HPX_INCLUDE_DIR})

add_hpx_component(MinComponent
    ESSENTIAL
    SOURCES MinComponent.cpp
)

add_hpx_executable(hpxct
    ESSENTIAL
    SOURCES main.cpp 
    COMPONENT_DEPENDENCIES MinComponent
)


