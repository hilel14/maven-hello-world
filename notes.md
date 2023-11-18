# Run the Docker image as regular user (not root)

sudo docker run --user=games hilel14/hello:1.0.6 /opt/hilel14/target/hello-1.0.6.jar

# Overide default entry-point

 sudo docker run -it --entrypoint /bin/bash hilel14/hello:1.0.6