## Custom Dockerfile
FROM consol/centos-xfce-vnc:1.1.0

ENV REFRESHED_AT 2017-04-10


ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 USER=$USER HOME=$HOME



RUN echo "The working directory is: $HOME"
RUN echo "The user is: $USER"

RUN mkdir -p $HOME
WORKDIR $HOME


## Install a gedit
USER 0
#RUN yum install -y gedit \
#    && yum clean all

RUN apt-get update && apt-get install -y \
        sudo \
        git \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    apt-utils \
    curl \
    nano \
    vim \
    libfreetype6-dev \
    libpng12-dev \
    libzmq3-dev \
    git \
    python-numpy \
    python-dev \
    python-opengl \
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
    python-opencv \
    terminator \
    tmux \
    libcanberra-gtk-module \
    libfuse2 \
    libnss3 \
    fuse \
    python3-tk \
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

# install Sublime Text
RUN wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - \
    && echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list \
    && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y sublime-text

#RUN pip3 install --upgrade pip

#RUN pip3 --no-cache-dir install \
#    gym[all]==0.10.3 \
#    mujoco-py \
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



## switch back to default user
USER 1984


ENV TERM xterm-256color
