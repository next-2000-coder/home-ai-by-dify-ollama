# build home ai server by dify + ollama

## refs

The official sources of dify and ollama.

- https://github.com/langgenius/dify
- https://github.com/ollama/ollama

I have refrences the follow documents & source.

- https://github.com/langgenius/dify/tree/main/docker
- https://ollama.com/blog/ollama-is-now-available-as-an-official-docker-image

### ollama model library, we can find the models informations

- https://ollama.com/library

## how to use this repo to build your own home ai servers

step1: install container engine

- you can use docker desktop , docker ce, or rancher desktop. At now, I'm using rancher desktop on my macbook air.
  follow the official document to install it.
- docker desktop: https://www.docker.com/products/docker-desktop/
- docker ce: https://docs.docker.com/engine/install/
- rancher desktop: https://docs.rancherdesktop.io/getting-started/installation

step2: You can use docker-compose to build your own ai servers. see the follow commands.

```sh
# copy the template env file to your local, to customize your configs
cp .en_template.env .env

# start the dify server
docker compose up -d
```

step3: pull the models by ollama

```sh
docker exec -it dify-server bash

# pull llama3.2, please see the
ollama pull llama3.2

# pull qwen2.5
ollama pull qwen2.5

```

step4: config the dify server

1. open the dify server in browser, <http://localhost>
2. at first time, you must wait a minute for the server to be initialized. after that, you can see the dify server and create the admin user.
3. add model configs at the setting page.
4. at last, you can create a chatbot and publish it.
5. enjion your own home ai server.

## troubleshoot

1. we can't pull the contianer image from docker hub , at china.

I have write a small script to pull the image from a mirror container registry.

- macosx

  ```sh
  # install skopeo

  brew install  skopeo

  # execute the script to pull all images from container registry to local.

  cd ./images

  ./start-pull-all-image.sh
  ```

- ubuntu

  ```sh
  # install skopeo

  sudo apt install -y skopeo

  # execute the script to pull all images from container registry to local.

  cd ./images

  ./start-pull-all-image.sh
  ```
