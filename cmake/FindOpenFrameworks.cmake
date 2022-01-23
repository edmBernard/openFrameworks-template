
add_library(openframeworks_interface INTERFACE)

#**************************************************************************************************
# Find Package ************************************************************************************
# Include Openframework dependency headers
find_package(libpng CONFIG REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE png)

find_package(CURL CONFIG REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE CURL::libcurl)

find_package(GLEW CONFIG REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE GLEW::GLEW)
target_include_directories(openframeworks_interface INTERFACE ${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include/GL)

find_library(GLEW_LIB glew32 REQUIRED)
message("GLEW_LIB ${GLEW_LIB}")
target_link_libraries(openframeworks_interface INTERFACE ${GLEW_LIB})

find_package(glm CONFIG REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE glm::glm)

find_package(pugixml CONFIG REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE pugixml pugixml::shared pugixml::pugixml)

find_package(ZLIB REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE ZLIB::ZLIB)

find_package(nlohmann_json CONFIG REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE nlohmann_json::nlohmann_json)
target_include_directories(openframeworks_interface INTERFACE ${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include/nlohmann)

find_package(uriparser CONFIG REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE uriparser::uriparser)

find_package(utf8cpp CONFIG REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE utf8cpp)

find_package(glfw3 CONFIG REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE glfw)

find_package(freetype CONFIG REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE freetype)

find_package(freeimage CONFIG REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE freeimage::FreeImage freeimage::FreeImagePlus)

find_package(RtAudio CONFIG REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE RtAudio::rtaudio)

find_package(unofficial-kissfft CONFIG REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE unofficial::kissfft::kissfft)

find_package(unofficial-libtess2 CONFIG REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE unofficial::libtess2::libtess2)

find_package(OpenAL CONFIG REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE OpenAL::OpenAL)

find_library(CAIRO_LIB cairo REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE ${CAIRO_LIB})
target_include_directories(openframeworks_interface INTERFACE ${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include/cairo)

find_package(SndFile CONFIG REQUIRED)
target_link_libraries(openframeworks_interface INTERFACE SndFile::sndfile)

target_include_directories(openframeworks_interface INTERFACE ${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include/gstreamer-1.0)
target_include_directories(openframeworks_interface INTERFACE ${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include/glib-2.0)
target_include_directories(openframeworks_interface INTERFACE ${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/lib/glib-2.0/include)

find_package(unofficial-videoInput REQUIRED)
find_package(unofficial-openframework REQUIRED)



# found openframework installation path
foreach(_folder ${CMAKE_SYSTEM_PREFIX_PATH})
  if(EXISTS "${_folder}/openframeworks")
    message("Path found at : ${_folder}/openframeworks")
    set(OPENFRAMEWORK_INSTALLED_DIR "${_folder}/openframeworks")
  else()
    message("Path not found at : ${_folder}/openframeworks")
  endif()
endforeach()

add_compile_definitions(OF_USING_STD_FS 1)
add_compile_definitions(OF_SOUND_PLAYER_OPENAL 1)

target_include_directories(openframeworks_interface INTERFACE ${OPENFRAMEWORK_INSTALLED_DIR}/include)

target_link_libraries(openframeworks_interface INTERFACE unofficial::openframework::openframework unofficial::videoInput::videoInput)
