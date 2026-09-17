:: Configure.
cmake %CMAKE_ARGS% ^
      -G "Ninja" ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D BUILD_SHARED_LIBS=ON ^
      -D CMAKE_BUILD_TYPE=Release ^
      -S %SRC_DIR% -B build
if errorlevel 1 exit 1

:: Build.
cmake --build build
if errorlevel 1 exit 1

:: Test.
cd build
ctest --output-on-failure
if errorlevel 1 exit 1
cd ..

:: Install.
cmake --install build
if errorlevel 1 exit 1
