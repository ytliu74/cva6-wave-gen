# cva6-wave-gen

## Usage

First pull the Docker image from the Docker Hub:

```bash
docker pull ytliu74/cva6:latest
```

Then run the script:

```bash
./run.sh <path_to_source>
```

For the `hello_world` example, run the following command:

```bash
./run.sh src/hello_world.c
```

Then the generated wave file will be in the `veri-testharness_sim` directory.