cmake_minimum_required(VERSION 3.13.0 FATAL_ERROR)

project(EVALAUTOR LANGUAGES CXX)

find_package(JlCxx REQUIRED)
add_library(CostEvaluator SHARED
Evmain.cpp
Block.cpp
District.cpp
Params.cpp
Point.cpp
)

# Include directories
target_include_directories(CostEvaluator PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})


target_link_libraries(CostEvaluator PUBLIC JlCxx::cxxwrap_julia)
find_package(OpenMP REQUIRED)
if(OpenMP_CXX_FOUND)
    target_link_libraries(CostEvaluator PUBLIC OpenMP::OpenMP_CXX)
endif()

set_target_properties(CostEvaluator PROPERTIES
    INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib;$<TARGET_FILE_DIR:JlCxx::cxxwrap_julia>"
)

message(STATUS "JlCxx found at $<TARGET_FILE_DIR:JlCxx::cxxwrap_julia>")