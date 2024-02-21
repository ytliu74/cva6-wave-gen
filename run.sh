#!/bin/bash

CFILE=$1  # The first positional parameter is the path to the C file

rm -rf veri-testharness_sim

# Ensure the wave_gen.sh script is executable
chmod +x wave_gen.sh

docker run --rm -v $(pwd):/mount ytliu74/cva6:latest /bin/bash /mount/wave_gen.sh $CFILE
