cmake_minimum_required(VERSION 3.15)
project(xerces_consumer LANGUAGES CXX)

find_package(XercesC CONFIG REQUIRED)

add_executable(xerces_consumer test.cpp)
target_link_libraries(xerces_consumer PRIVATE XercesC::XercesC)
