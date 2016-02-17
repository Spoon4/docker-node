FROM node:argon

MAINTAINER Spoon <spoon4@gmail.com>

ENV SRC /usr/src

RUN mkdir -p ${SRC}
COPY package.json ${SRC}/package.json
COPY bower.json $SRC/bower.json
COPY .bowerrc $SRC/.bowerrc

ENV PATH /usr/src/node_modules/.bin:${PATH}

WORKDIR $SRC
RUN npm install
RUN bower install

VOLUME [ "${SRC}/node_modules", "${SRC}/app/bower_components" ]

CMD ["echo", "Dependencies container for NodeJs"]