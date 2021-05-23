1. Dockerfile is used to create docker images.
2. Dockerfile have instructions or layers which are required to create a docker image.
3. Dockerfile consists of below Instructions/Commands/Attributes/Directives.

Reference: https://design.jboss.org/redhatdeveloper/marketing/docker_cheatsheet/cheatsheet/images/docker_cheatsheet_r3v2.pdf

FROM Sets the base image for subsequent layers.
MAINTAINER Sets the author field of the generated images
RUN Execute commands in a new layer on top of the current image and commit the results
CMD It is same as "RUN", but it is Allowed only once. (if many then last one takes effect)
LABEL Adds metadata to an image
EXPOSE Informs container runtime that the container listens on the specified network ports at runtime
ENV Sets an environment variable.
ADD Copy new files, directories, or remote file URLs from into the filesystem of the container
COPY Copy new files or directories into the filesystem of the container
ENTRYPOINT Allows you to configure a container that will run as an executable
VOLUME Creates a mount point and marks it as holding externally mounted volumes from native host or other containers
USER Sets the username or UID to use when running the image
WORKDIR Sets the working directory for any RUN, CMD, ENTRYPOINT, COPY, and ADD commands
ARG Defines a variable that users can pass at build-time to the builder using --build-arg
ONBUILD Adds an instruction to be executed later, when the image is used as the base for another build
STOPSIGNAL Sets the system call signal that will be sent to the container to exit


1. Once the Dockerfile is created, we need to create docker image using below command.

Ex: Our Dockerfile directory - /home/ubuntu

Server1:

1. cd /home/ubuntu
2. ll -> it will show Dockerfile.
3. pwd
4. docker build -t mydockerimage .
layer1
layer2
.
.
.
.
.
5. sudo docker images 
mydockerimage Image_ID
6. Push the docker image to docker registry.
7. docker login -u {username} -p {password} {docker_registry_url}
8. docker tag {Image_ID} {docker_registry_url}/mydockerimage:{tag}
9. docker push {docker_registry_url}/mydockerimage:{tag}
10. Now delete the docke image in local server.
11. sudo docker rmi mydockerimage



Server2:

1. sudo docker login -u {username} -p {password} {docker_registry_url}
2. sudo docker pull {docker_registry_url}/mydockerimage:{tag}
3. sudo docker images 
4. sudo docker run -d/it -p 8080:8080 -v {volume_mapping} -e {env_variables} ....etc mydockerimage:{tag}
6. sudo docker ps -a
7. sudo docker exec -it {container_id} /bin/bash






