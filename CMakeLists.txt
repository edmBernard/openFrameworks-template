cmake_minimum_required(VERSION 3.21)

#**************************************************************************************************
# Project *****************************************************************************************
project(openFrameworks-template
        HOMEPAGE_URL https://github.com/edmBernard/openFrameworks-template)

#**************************************************************************************************
# Find Package ************************************************************************************
find_package(cxxopts REQUIRED)
find_package(spdlog CONFIG REQUIRED)
find_package(fmt CONFIG REQUIRED)

include(cmake/FindOpenFrameworks.cmake)

# get_cmake_property(_variableNames VARIABLES)
# list (SORT _variableNames)
# foreach (_variableName ${_variableNames})
#     message(STATUS "${_variableName}=${${_variableName}}")
# endforeach()

#**************************************************************************************************
# Include *****************************************************************************************
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src)

#**************************************************************************************************
# Set compiler ************************************************************************************
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

if (CMAKE_SYSTEM_NAME STREQUAL "Windows")
  add_compile_options(/Oy /utf-8 /Zc:__cplusplus /DUNICODE /D_UNICODE)
else()
  add_compile_options(-fPIC -O3 -fno-omit-frame-pointer)
endif()

#**************************************************************************************************
# Set variable ************************************************************************************
SET(SOURCES
  ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/ofApp.cpp
)

#**************************************************************************************************
# Make configuration ******************************************************************************
add_executable(openFrameworks-template ${SOURCES})
target_link_libraries(openFrameworks-template PRIVATE fmt::fmt-header-only spdlog::spdlog_header_only cxxopts::cxxopts openframeworks_interface)
