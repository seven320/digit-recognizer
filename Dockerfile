FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

# when doker build
RUN apt-get update &&\
    DEBIAN_FRONTEND=noninteractive \ 
    apt-get install -y --no-install-recommends \ 
    #pyenv 
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    curl \
    llvm \
    libncurses5-dev \ 
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    git\ 
    g++ \
    wget \
    make \
    vim\
    tmux\
    unzip\
    # open CV
    yasm pkg-config libswscale-dev libtbb2 libtbb-dev\
    libjpeg-dev libpng-dev libtiff-dev libavformat-dev libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Python3
RUN git clone https://github.com/pyenv/pyenv.git /opt/pyenv
ENV PYENV_ROOT="/opt/pyenv"
ENV PATH="$PYENV_ROOT/bin:${PATH}"
ENV PATH="$PYENV_ROOT/shims:${PATH}"
RUN pyenv install 3.7.3 && pyenv global 3.7.3

# library
RUN pip install --upgrade pip

RUN pip install \
    numpy==1.17.2 \
    opencv-python==4.1.1.26 \ 
    opencv-contrib-python==4.1.1.26 \
    Cython==0.29.13 \
    protobuf==3.9.2 \
    torch==1.6.0+cu92 \
    torchvision==0.7.0+cu92 -f https://download.pytorch.org/whl/torch_stable.html \
    jupyterlab==1.1.4 \
    ipywidgets==7.5.1 \
    scipy==1.3.1 \
    matplotlib==3.1.2 \
    pandas==0.25.1 \
    tqdm==4.36.1 \
    slackweb==1.0.5 \
    click==7.0 \
    Pillow==6.2.1 \
    seaborn==0.10.1 \
    future==0.11.1
RUN pip install tqdm==4.36.1 \
    folium==0.10.0
#scikit-image
RUN pip install \
    scikit-image==0.16.2 \
    scikit-plot==0.3.7	
# tensorflow
RUN pip install \
    setuptools==41.4.0 \
    tensorflow==2.0.0 \
    tensorboardX==1.9 \
    optuna==0.19.0 \
    gym==0.17.2
RUN pip install \
    pytorch-lightning==0.6.0 \
    tifffile
# for HRNet
RUN pip install \
    ninja==1.10.0 \
    yacs==0.1.5 \
    Cython==0.29.21
# for efficient net
RUN pip install \
    efficientnet_pytorch==0.7.0 \
    segmentation-models-pytorch==0.1.2

RUN pip install \
    kaggle==1.5.9 \
    pytorch-lightning==1.0.8
 
#    jupyter nbextension install https://github.com/shiba6v/jupyter-shape-commentator/archive/master.zip --user
RUN jupyter nbextension enable --py widgetsnbextension

ENV USER seven320
ENV HOME /home/${USER}
ENV SHELL /bin/bash
EXPOSE 8889
