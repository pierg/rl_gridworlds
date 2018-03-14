#!/usr/bin/env bash

PYTHONPATH=../gridworld_environments/:$PYTHONPATH
PYTHONPATH=../gridworld_agent/:$PYTHONPATH
PYTHONPATH=../:$PYTHONPATH
export PYTHONPATH

python3 main.py --config ./config/pong.json