# wangle_template
template project for wangle servers

### osx build
#### get folly and its deps
```bash
brew install folly
```
#### checkout and build wangle
```bash
git clone https://github.com/facebook/wangle.git
cd wangle/wangle
cmake -DOPENSSL_ROOT_DIR=/usr/local/opt/openssl .
make
ctest
sudo make install
```
#### build app
```bash
sh rename_app.sh {your app name}
sh run_cmake_osx.sh
```

