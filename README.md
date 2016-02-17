# docker-node

Docker services with data container embedding [NodeJs][nodejs].

### Build and run NodeJs containers

    docker-compose up -d master

With `docker-compose ps` you should have something like that

```
      Name                    Command               State            Ports          
-----------------------------------------------------------------------------------
dockernode-data    echo Dependencies containe ...   Exit 0                          
dockernode-master  npm start                        Up       0.0.0.0:8000->8000/tcp
```

### Web interface

    http://localhost:8000

## dockernode-master

Install NodeJs and dependencies.

Full Docker compose service using [`node:argon`][node-argon] image.

## dockernode-data

This container is reponsible to persist [npm][npm] and [bower][bower] packages.

bower packages are downloaded in `/usr/src/app/bower_components` to be accessible from node server in master container.
This is done by setting `directory` configuration in [`.bowerrc`][bowerrc].

bower basicaly doesn't allow command execution by root user. Given that Docker commands are executed by root user, this is bypassed by setting the configuration `allow_root` to `true` in [`.bowerrc`][bowerrc] file.

## :construction: dockernode-pandoc

[Pandoc][pandoc] container using [silviof/docker-pandoc][docker-pandoc] Docker image.

Generates documentation from `doc/` folder by creating a temporary HTML file.

### dockernode-pdf

Docker compose service to generate a **PDF** from Markdown documentation.

### dockernode-docx

Docker compose service to generate a **Word** file from Markdown documentation.

[nodejs]:        https://nodejs.org
[npm]:           http://www.npmjs.com
[bower]:         http://bower.io/
[pandoc]:        http://pandoc.org/
[docker-pandoc]: https://hub.docker.com/r/silviof/docker-pandoc/
[node-argon]:    https://hub.docker.com/_/node/
[bowerrc]:       .bowerrc