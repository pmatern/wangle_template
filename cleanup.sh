#!/env/sh
make clean
rm Makefile
rm app_config.h
rm __REPLACE__
find . -iwholename '*cmake*' -not -name CMakeLists.txt -and -not -name run_cmake_osx.sh -and -not \( -path ./cmake -prune \) -exec rm -rf {} \;
