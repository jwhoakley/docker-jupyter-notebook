# docker-jupyter-notebook

Initial starting point for this owes credit to https://u.group/thinking/how-to-put-jupyter-notebooks-in-a-dockerfile/

## Standalone Container

Run with:

	docker run -p 8888:8888 jwhoakley/jupyter-notebook


## Docker Compose

Run in same directory as the docker-compose.yml file with:

	docker-compose up -d
	
## Docker Stack

Run with:

	docker stack deploy -c jupyter-notebook-stack.yml jupyter

