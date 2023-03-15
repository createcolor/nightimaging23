# Final submission docker guidelines

All final submissions should be submitted as a docker image. The docker image should be built from the dockerfile in the root of the repository. The docker image should be built with the following command:

```bash
    docker build -t <your_team_name> .
```

The docker image should be run with the following command:

```bash
    docker run -it --rm -v $(pwd)/data:/data <your_team_name> ./run.sh
```

As output, the docker image should produce images in `JPEG` format in the `/data` directory. All produced files should be named as the input files, but with the `.jpg` extension. The filenames should be the same as the RAW input filenames in `/data`. Make sure that your code does not create any other folders in the `/data` directory. Docker should contain all the necessary dependencies to run the code. It also should include the `run.sh` script as the entrypoint. Take into account that inside the docker image, the `/data` directory will be mounted to the `$(pwd)/data` directory of the host machine. This means that the docker image should be able to read the input files from the `/data` directory and write the output files to the `/data` directory.

## Example

We providing an example of a docker image that can be used as a reference. It can be found in our [github repository](https://github.com/createcolor/nightimaging23)

Your dockerfile may look like this:

```dockerfile
FROM tensorflow/tensorflow:2.3.0
WORKDIR /opt/app
COPY . .
RUN pip install -r /app/requirements.txt
CMD ["./run.sh"]
```
