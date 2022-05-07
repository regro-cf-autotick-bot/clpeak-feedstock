mkdir build
cd build

cmake ${CMAKE_ARGS} -G Ninja ..
ninja -j${CPU_COUNT}
ninja -j${CPU_COUNT} install
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
ctest
fi
