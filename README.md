# openFrameworks-template

Minimal project to show an openFrameworks integration. The code inside `src/ofApp.cpp` is one of the openFrameworks example.
- Github : [https://github.com/edmBernard/openFrameworks-template](https://github.com/edmBernard/openFrameworks-template)

## Build and Dependencies

### General Dependencies

We use [vcpkg](https://github.com/Microsoft/vcpkg) to manage dependencies

This project depends on:
- [cxxopts](https://github.com/jarro2783/cxxopts): Command line argument parsing
- [fmt](https://fmt.dev/latest/index.html): A modern formatting library
- [spdlog](https://github.com/gabime/spdlog): Very fast, header-only/compiled, C++ logging library

```
./vcpkg install cxxopts spdlog fmt
```

### openFrameworks

- [openFrameworks](https://github.com/openframeworks/openFrameworks): openFrameworks is a community-developed cross platform toolkit for creative coding in C++

#### openFrameworks dependencies

We use [vcpkg](https://github.com/Microsoft/vcpkg) to manage openFrameworks dependencies. Unfortunatly it's not a method maintained by openFrameworks.
There is a fork of openFrameworks just to support dependencies from vcpkg avaiblable [here](https://github.com/edmBernard/openFrameworks). We just add a cmake that import all dependencies and add submodule for the missing dependencies from vcpkg.

openFrameworks has lots of dependencies they can be seen in the following file [`cmake/FindOpenFrameworks.cmake`](cmake/FindOpenFrameworks.cmake)

```
./vcpkg install (all openFrameworks dependencies)
```

#### openFrameworks itself

To install openFrameworks we will use my fork available [here](https://github.com/edmBernard/openFrameworks)

```bash
git clone git@github.com:edmBernard/openFrameworks.git
cd openFrameworks
mkdir build
cd build
# configure cmake with vcpkg toolchain
cmake .. -DCMAKE_TOOLCHAIN_FILE=${VCPKG_DIR}/scripts/buildsystems/vcpkg.cmake -DCMAKE_PREFIX_PATH=/user/local
# on Windows : cmake .. -DCMAKE_TOOLCHAIN_FILE=${env:VCPKG_DIR}/scripts/buildsystems/vcpkg.cmake -DCMAKE_PREFIX_PATH=C:/cmake
cmake --build . --config Release
```

### Build the project

```bash
mkdir build
cd build
# configure make with vcpkg toolchain
cmake .. -DCMAKE_TOOLCHAIN_FILE=${VCPKG_DIR}/scripts/buildsystems/vcpkg.cmake -DCMAKE_PREFIX_PATH=/user/local
# on Windows : cmake .. -DCMAKE_TOOLCHAIN_FILE="$Env:VCPKG_DIR/scripts/buildsystems/vcpkg.cmake" -DCMAKE_PREFIX_PATH=C:/cmake
cmake --build . --config Release
```

The executable is named `openFrameworks-template`

## Disclaimer

It's a toy project. So if you spot error, improvement comments are welcome.
