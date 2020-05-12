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
     apt purge --auto-remove cmake && \
     wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add - && \
     apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main' && \
     apt update && \
     apt install cmake

# 4) change back to notebook user
USER $NB_UID