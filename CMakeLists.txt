cmake_minimum_required(VERSION 3.24)

project(CUDATests LANGUAGES C CXX CUDA)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CUDA_STANDARD 20)
set(CMAKE_CUDA_EXTENSIONS OFF)

if(NOT DEFINED CMAKE_CUDA_ARCHITECTURES)
    set(CMAKE_CUDA_ARCHITECTURES native)
endif()
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

find_package(CUDAToolkit REQUIRED)

file(GLOB_RECURSE SOURCE_FILES
    CUDATests/*.cu
    CUDATests/*.cuh
    CUDATests/*.cpp
    CUDATests/*.hpp
)

set(INCLUDE_DIRS
    CUDATests/Source
    CUDATests/Include
)

set(LIB_LINKS CUDA::cudart)

add_executable(CUDATests ${SOURCE_FILES})
target_include_directories(CUDATests PUBLIC ${INCLUDE_DIRS})
target_link_libraries(CUDATests PUBLIC ${LIB_LINKS})
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT CUDATests)
