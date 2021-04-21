#! /usr/bin/env bash

project=$1
echo Running create-react-app $project...
npx create-react-app $project || \
	echo -e "Failed to create-react-app $project.\nExiting..."

cd $project || exit
cat >> dev.Dockerfile << EOF
FROM node:lts-alpine AS ${project}-dev
WORKDIR /app

COPY . .
RUN yarn

ENV HOST="0.0.0.0"
EXPOSE 3000

CMD ["yarn", "start"]
EOF

#docker build -t ${project}-dev -f dev.Dockerfile .
#docker run --rm -v ${project}:/app -p 3000:3000 ${project}-dev

cat >> docker-compose.yml << EOF
version: "3"
services:
    dev:
        build:
            context: .
            dockerfile: dev.Dockerfile
        ports:
            - '3000:3000'
        volumes:
            - './:/app'
EOF

echo Running docker-compose up
docker-compose up
