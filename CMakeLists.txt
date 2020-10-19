cmake_minimum_required (VERSION 3.6.1)
project(pandemic-hoya-2002)

set (CMAKE_CXX_STANDARD 17)
set (CMAKE_CXX_COMPILER "g++")
add_compile_options(-g)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../cadmium/include)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../cadmium/json)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../cadmium/json/include)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

set(Boost_USE_MULTITHREADED TRUE)
find_package(Boost COMPONENTS unit_test_framework system thread REQUIRED)

include(FindOpenMP)
if(OPENMP_FOUND)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${OpenMP_EXE_LINKER_FLAGS}")
else(OPENMP_FOUND)
  message("ERROR: OpenMP could not be found.")
endif(OPENMP_FOUND)

file(MAKE_DIRECTORY logs)

add_executable(hoya src/main.cpp)

target_link_libraries(hoya PUBLIC ${Boost_LIBRARIES})

add_executable(parallel_hoya src/main.cpp)

target_compile_definitions(parallel_hoya PUBLIC CPU_PARALLEL)

#target_compile_definitions(parallel_hoya PRIVATE OpenMP::OpenMP_CXX)