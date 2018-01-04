# wangle_template
template_project for wangle servers

##osx build
### get folly and its deps
brew install folly

### checkout and build wangle
git clone https://github.com/facebook/wangle.git
cd wangle
cmake -DOPENSSL_ROOT_DIR=/usr/local/opt/openssl .
make
ctest
sudo make install

### build app
sh run_cmake_osx.sh

