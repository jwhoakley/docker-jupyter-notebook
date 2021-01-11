# docker-jupyter-notebook

Initial starting point for this owes credit to https://u.group/thinking/how-to-put-jupyter-notebooks-in-a-dockerfile/

For running this with password access it is necessary to drop a couple of files into the container:

First, the Jupyter Notebook configuration: jupyter_notebook_config.py

Secondly, the Jupyter Notebook json file containing the hashed password: jupyter_notebook_config.json


## Standalone Container

Run with:

	docker run -p 8888:8888 --mount source=/local_volume,target=/root jwhoakley/jupyter-notebook:latest

When running the container standalone (without compose or stacks), you don't have access to Docker secrets. Hence, pass the two files into the container through a volume mount - e.g. NFS host mount.


## Docker Compose

Run in same directory as the docker-compose.yml file with:

	docker-compose up -d

Docker-compose allows us to pass files to container through Docker secrets.


## Docker Stack

Run with:

	docker stack deploy -c jupyter-notebook-stack.yml jupyter

Docker stacks allow us to pre-load the two files into Docker secrets.


## Work to do

Setup HTTPS certificate and Traefik to publish the service against a DNS name rather than IP address
https://jupyter-notebook.readthedocs.io/en/stable/public_server.html#notebook-public-server
