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
    git


# Install python and pip
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python-pip \
    python-numpy \
    python-dev


# install pip dependencies
RUN pip --no-cache-dir install \
    absl-py


RUN mkdir -p $HOME
WORKDIR $HOME

# Clone repositories
RUN git clone --recursive https://github.com/pierg/rl_gridworlds.git
RUN git clone https://github.com/openai/baselines.git
RUN git clone https://github.com/MG2033/A2C.git