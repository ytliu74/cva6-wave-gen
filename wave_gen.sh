#!/bin/bash

CFILE=$1  # The first positional parameter is the path to the C file

cd /root/cva6

export RISCV=/opt/riscv
export NUM_JOBS=8
source verif/sim/setup-env.sh
export DV_SIMULATORS=veri-testharness
export TRACE_FAST=1

cd verif/sim

python3 cva6.py --target cv32a60x --iss=$DV_SIMULATORS --iss_yaml=cva6.yaml \
--c_tests /mount/"$CFILE" \
--linker=../tests/custom/common/test.ld \
--gcc_opts="-static -mcmodel=medany -fvisibility=hidden -nostdlib \
-nostartfiles -g ../tests/custom/common/syscalls.c \
../tests/custom/common/crt.S -lgcc \
-I../tests/custom/env -I../tests/custom/common"

# Copy the results to the /mount directory
cp -r /root/cva6/verif/sim/out_*/veri-testharness_sim /mount
# Give the user ownership of the files
chmod 777 /mount/veri-testharness_sim
