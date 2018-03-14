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
    software-properties-common \
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

# Installing python3.6
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt update
RUN apt install -y \
    python3.6 \
    python3.6-dev \
    python3.6-venv
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3.6 get-pip.py
RUN ln -s /usr/bin/python3.6 /usr/local/bin/python3
RUN rm get-pip.py

RUN apt install -y \
    python3-numpy \
    python3-scipy

# Installing pip and pip3
RUN apt-get remove python-pip python3-pip
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN python3.6 get-pip.py
RUN rm get-pip.py
RUN echo "PATH=\$PATH:/usr/local/bin" >> ~/.bashrc


# install pip dependencies
RUN python -m pip install -U --force-reinstall pip
RUN pip install --upgrade pip
RUN pip --no-cache-dir install \
    absl-py \
    enum34

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

RUN pip3 install -U numpy
#    scipy==0.13.3 \
#    numpy
#    absl-py \
#    enum34


RUN mkdir -p $HOME
WORKDIR $HOME

ENV TERM=xterm-256color

# Clone repositories
#RUN git clone --recursive https://github.com/pierg/rl_gridworlds.git