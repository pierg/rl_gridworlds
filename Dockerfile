FROM consol/ubuntu-xfce-vnc:1.1.0

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 USER=$USER HOME=$HOME
ENV TERM xterm-256color

RUN echo "The working directory is: $HOME"
RUN echo "The user is: $USER"

USER 0

RUN apt-get update && apt-get install -y \
        sudo \
        git \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

# install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    curl \
    nano \
    vim \
    git

# install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    cmake \
    zlib1g-dev \
    libjpeg-dev \
    xvfb \
    libav-tools \
    xorg-dev \
    libboost-all-dev \
    libsdl2-dev \
    swig \
    libgtk2.0-dev \
    wget \
    ca-certificates \
    unzip \
    aptitude \
    pkg-config \
    qtbase5-dev \
    libqt5opengl5-dev \
    libassimp-dev \
    libpython3.5-dev \
    libboost-python-dev \
    libtinyxml-dev \
    golang \
    terminator \
    tmux \
    libcanberra-gtk-module \
    libfuse2 \
    libnss3 \
    fuse \
    libglfw3-dev \
    libgl1-mesa-dev \
    libgl1-mesa-glx \
    libglew-dev \
    libosmesa6-dev \
    net-tools \
    xpra \
    xserver-xorg-dev \
    libffi-dev \
    libxslt1.1 \
    libglew-dev \
    parallel \
    htop \
    apt-transport-https

# Install python and pip
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python-pip \
    python3-pip \
    python-numpy \
    python-dev \
    python-opengl \
    python-opencv \
    python3-tk


# install python 2 dependencies
RUN pip install --upgrade pip
RUN pip --no-cache-dir install \
    absl-py \
    enum34



# install python 3 dependencies
RUN pip3 install --upgrade pip
RUN pip3 --no-cache-dir install \
    gym[atari,classic_control,robotics] \
    scipy \
    tqdm \
    joblib \
    zmq \
    dill \
    progressbar2 \
    mpi4py \
    cloudpickle \
    tensorflow>=1.4.0 \
    click




#RUN pip3 --no-cache-dir install \
#    gym[all]==0.10.3 \
#    scikit-image \
#    plotly \
#    ipykernel \
#    jupyter \
#    jupyterlab \
#    matplotlib \
#    numpy \
#    scipy \
#    sklearn \
#    pandas \
#    Pillow \
#    empy \
#    tqdm \
#    pyopengl \
#    ipdb \
#    cloudpickle \
#    imageio \
#    mpi4py \
#    jsonpickle \
#    gtimer \
#    path.py \
#    cached-property \
#    flask \
#    joblib \
#    lasagne \
#    PyOpenGL \
#    six \
#    pyprind




## Set up permissions to use same UID and GID as host system user
## https://denibertovic.com/posts/handling-permissions-with-docker-volumes/
#RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
#RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture)" \
#    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture).asc" \
#    && gpg --verify /usr/local/bin/gosu.asc \
#    && rm /usr/local/bin/gosu.asc \
#    && chmod +x /usr/local/bin/gosu
#
## Install Baselines
#RUN cd /opt && git clone https://github.com/openai/baselines.git && cd baselines && pip install -e .
#
#
#
## Install MuJoCo 1.50 and 1.31
#WORKDIR /opt
#RUN mkdir mujoco && cd mujoco \
#    && wget https://www.roboti.us/download/mjpro150_linux.zip \
#    && unzip mjpro150_linux.zip \
#    && rm mjpro150_linux.zip \
#    && wget https://www.roboti.us/download/mjpro131_linux.zip \
#    && unzip mjpro131_linux.zip \
#    && rm mjpro131_linux.zip \
#    && if [ -f "/mjkey.txt" ]; \
#        then \
#            mv /mjkey.txt . && \
#            cp mjkey.txt mjpro150/bin/ && \
#            cp mjkey.txt mjpro131/bin/ && \
#            echo "Installed MuJoCo Key file." ; \
#        else \
#            echo "Could not find MuJoCo key file (mjkey.txt) in ./internal!\nPlease copy it manually to ~/.mujoco when inside the docker container." 1>&2 ; \
#       fi
#ENV MUJOCO_PY_MJPRO_PATH=/opt/mujoco/mjpro150
#ENV MUJOCO_LICENSE_KEY=/opt/mujoco/mjkey.txt
#ENV MUJOCO_PY_MUJOCO_PATH=/opt/mujoco
#ENV LD_LIBRARY_PATH /opt/mujoco/mjpro150/bin:$LD_LIBRARY_PATH
#
#
#
## Install mujoco-py
#RUN pip3 --no-cache-dir install mujoco-py==0.5.7



## install python 3 dependencies
#RUN pip3 install --upgrade pip
#RUN pip3 --no-cache-dir install \
#    gym[atari,classic_control,robotics] \
#    scipy \
#    tqdm \
#    joblib \
#    zmq \
#    dill \
#    progressbar2 \
#    mpi4py \
#    cloudpickle \
#    tensorflow>=1.4.0 \
#    click


RUN mkdir -p $HOME
WORKDIR $HOME

# Clone repositories
RUN git clone --recursive https://github.com/pierg/rl_gridworlds.git
RUN git clone https://github.com/openai/baselines.git