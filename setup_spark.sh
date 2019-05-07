echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 
apt-get install -y oracle-java8-installer
apt-get install -y cmake g++ libtool rsync make x11-apps python3-dev python3-numpy python3-pip python3-tk python3-pip
apt-add-repository ppa:webupd8team/java
apt-get update
rm -rf /var/lib/apt/lists/*

wget https://www.apache.org/dyn/closer.lua/spark/spark-2.4.2/spark-2.4.2-bin-hadoop2.7.tgz &&\
    tar -zxvf park-2.4.2-bin-hadoop2.7.tgz -C /usr/local/

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
    pip install --no-cache-dir pyspark llvmlite matplotlib numba scipy numpy pandas ipykernel lz4 pyarrow tqdm py4j scikit-learn keras tensorflow jupyter metakernel zmq notebook==5.* plaidml-keras plaidbench energyflow uproot uproot-methods 

# get dependencies for FNAL columnar analysis
#echo "pip will now install fnal-columnar-analysis"
#pip install fnal-column-analysis-tools && git clone -b processor git@github.com:CoffeaTeam/fnal-column-analysis-tools.git && pushd fnal-column-analysis-tools && pip uninstall fnal-column-analysis-tools && python setup.py install &&popd

# progressbar, sliders, etc.
jupyter nbextension enable --py widgetsnbextension


#ipython kernel install --user --name "py36" --display-name "py36"
