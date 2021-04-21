# Docker React App

A bash script that creates a react app and starts the development server using Docker. Use of Docker volumes for storage allows support for hot-reloading of react applications.

On running the ./dra.sh project-name  from a bash shell:
1. A react app is created with the given name
2. dev.Dockerfile and docker-compose.yml files are created in the application folder
3. docker-compose is used to start the development server for the react app on localhost:3000

To stop the server, you can halt the container using docker CLI or the Docker Desktop GUI.

To restart the server, you can:
1. Rerun the docker container using docker CLI or Docker Desktop GUI
2. Run docker compose up inside the folder

## Requirements

Following programs need to be installed to run the script:
- Bash shell
- docker
- docker-compose
- npm and npx
- node docker image

## Roadmap

- Add commands to package.json as npm scripts
