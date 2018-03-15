#!/usr/bin/env bash
docker run -it \
	-p 5901:5901 \
	-p 6901:6901 \
	-v ~/Dropbox/Projects/rl_gridworlds:/headless/rl_gridworlds \
	rl_gridworlds \
	bash