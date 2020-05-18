# 1) choose base container
# generally use the most recent tag

# data science notebook
# https://hub.docker.com/repository/docker/ucsdets/datascience-notebook/tags
#ARG BASE_CONTAINER=ucsdets/datascience-notebook:2019.4.7

# scipy/machine learning (tensorflow)
# https://hub.docker.com/repository/docker/ucsdets/scipy-ml-notebook/tags
ARG BASE_CONTAINER=ucsdets/scipy-ml-notebook:2019.4.6

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

# 3) install packages
#RUN pip install networkx rpy2==3.1.0 python-igraph powerlaw numpy scipy python-louvain
RUN  apt-get update && \
     apt-get install -y libboost-all-dev && \
     apt-get install -y apt-transport-https && \
     apt-get install -y ca-certificates && \
     apt-get install -y gnupg && \
     apt-get install -y software-properties-common && \
     apt-get install -y wget && \
     wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null && \
     apt-add-repository -y 'deb https://apt.kitware.com/ubuntu/ bionic main' && \
     apt-get update && \
     apt-get install -y cmake && \
#      pip uninstall -y torch

#      CUDNN_DOWNLOAD_SUM=28355e395f0b2b93ac2c83b61360b35ba6cd0377e44e78be197b6b61b4b492ba && \
#      curl -fsSL http://developer.download.nvidia.com/compute/redist/cudnn/v7.6.5/cudnn-10.0-linux-x64-v7.6.5.32.tgz -O && \
#      echo "$CUDNN_DOWNLOAD_SUM  cudnn-10.0-linux-x64-v7.6.5.32.tgz" | sha256sum -c - && \
#      tar --no-same-owner -xzf cudnn-10.0-linux-x64-v7.6.5.32.tgz -C /usr/local --wildcards 'cuda/lib64/libcudnn.so.*' && \
#      rm cudnn-10.0-linux-x64-v7.6.5.32.tgz && \
#      ldconfig
#      wget --no-check-certificate --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies 'https://docs.google.com/uc?export=download&id=1LY_Cc8Kb6YsZWNs7z78Yd48lPoV4wIgp' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1LY_Cc8Kb6YsZWNs7z78Yd48lPoV4wIgp" -O temp.tgz && rm -rf /tmp/cookies.txt && \
#      CUDNN_TAR_FILE="temp.tgz" && \
#      tar -xzvf ${CUDNN_TAR_FILE} && \
#      cp -P cuda/include/cudnn.h /usr/local/cuda-10.0/include/ && \
#      cp -P cuda/lib64/libcudnn* /usr/local/cuda-10.0/lib64/ && \
#      chmod a+r /usr/local/cuda-10.0/lib64/libcudnn* && \
#      chmod a+r /usr/local/cuda-10.0/include/cudnn.h && \
#      export PATH=/usr/local/cuda/bin${PATH:+:${PATH}} && \
#      export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}} && \
#      apt-get install -y git && \
#      mkdir tempspconv && \
#      cd tempspconv && \
#      git clone https://github.com/traveller59/spconv.git --recursive && \
#      cd spconv && git checkout 7342772 && \
#      python setup.py bdist_wheel && \
#      cd ./dist && pip install *
     #cd spconv && \
     #python setup.py bdist_wheel

#      export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}
#      export LD_LIBRARY_PATH=/usr/local/cuda-10.0.0/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}


# 4) change back to notebook user
#USER $NB_UID
