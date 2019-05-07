apt-get update
apt-get install -y zlib1g zlib1g-dev libssl-dev cmake

wget http://xrootd.org/download/v4.9.0/xrootd-4.9.0.tar.gz && \
    tar zxf xrootd-4.9.0.tar.gz && \
    mkdir build-xrootd && \
    cd build-xrootd && \
    cmake ../xrootd-4.9.0 && \
    make && make install && \
    cd .. && rm -rf build-xrootd && \
    cp xrd_setup.py xrootd-4.9.0/bindings/python/ && \
    cd xrootd-4.9.0/bindings/python/ && \
    python xrd_setup.py install --user && \
    cd ../../../ 

pip install --upgrade pip && \
    pip install --no-cache-dir llvmlite numba lz4 uproot uproot-methods 

# get dependencies for FNAL columnar analysis
#echo "pip will now install fnal-columnar-analysis"
#pip install fnal-column-analysis-tools && git clone -b processor git@github.com:CoffeaTeam/fnal-column-analysis-tools.git && pushd fnal-column-analysis-tools && pip uninstall fnal-column-analysis-tools && python setup.py install &&popd

# progressbar, sliders, etc.
jupyter nbextension enable --py widgetsnbextension


#ipython kernel install --user --name "py36" --display-name "py36"
