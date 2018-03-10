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
    gym \
    scipy \
    tqdm \
    joblib \
    zmq \
    dill \
    progressbar2 \
    mpi4py \
    cloudpickle \
    tensorflow>=1.4.0 \
    click \
    bunch \
    matplotlib \
    Pillow


RUN mkdir -p $HOME
WORKDIR $HOME

# Clone repositories
RUN git clone --recursive https://github.com/pierg/rl_gridworlds.git
RUN git clone https://github.com/openai/baselines.git
RUN git clone https://github.com/MG2033/A2C.git