# latest working tag "3.41.5"
FROM ghost

# Fix for the interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# allow unauthenticated and allow downgrades for special libcublas library
RUN apt-get update \
 && apt-get install -y --no-install-recommends --allow-unauthenticated\
    nano \
    ca-certificates \
    curl \
    git \
    wget \
    npm \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN npm install -g ghost-static-site-generator

ENV DOMAIN ""
ENV URL ""

# Do not replace the ENTRYPOINT/CMD of the base image
