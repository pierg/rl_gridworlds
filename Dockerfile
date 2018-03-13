FROM consol/ubuntu-xfce-vnc:1.1.0

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 USER=$USER HOME=$HOME

RUN echo "The working directory is: $HOME"
RUN echo "The user is: $USER"

USER 0

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
    git \
    zlib1g-dev \
    cmake \
    ffmpeg


# Install python and pip
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python-numpy \
    python-dev

# Installing pip and pip3
RUN apt-get remove python-pip python3-pip
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN python3 get-pip.py
RUN rm get-pip.py
RUN echo "PATH=\$PATH:/usr/local/bin" >> ~/.bashrc


# install pip dependencies
RUN pip install --upgrade pip
RUN pip --no-cache-dir install \
    absl-py

# install python 3 dependencies
RUN pip3 install --upgrade pip
RUN pip3 --no-cache-dir install \
    gym \
    tensorflow==1.5 \
    click \
    bunch==1.0.1 \
    tqdm \
    matplotlib \
    Pillow \
    atari-py


RUN mkdir -p $HOME
WORKDIR $HOME

# Clone repositories
RUN git clone --recursive https://github.com/pierg/rl_gridworlds.git