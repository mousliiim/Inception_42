FROM alpine:3.18

ARG VUE_JS=8.1.23-r0 \
    NPM_VERSION=9.6.6-r0 \
    NODEJS_VERSION=18.17.1-r0 \
	VUE_USER=vuejs-user

RUN addgroup -S -g 2011 ${VUE_USER} && adduser -S ${VUE_USER} -G ${VUE_USER}

RUN apk update -U && \
    apk add --no-cache vim bash curl wget git \
    nodejs=${NODEJS_VERSION} npm=${NPM_VERSION}

RUN npm install -g @vue/cli

WORKDIR /var/www/vue-app

RUN git clone https://github.com/hanu-developer/docker-vuejs.git

EXPOSE 8080

CMD ["tail", "-f"]