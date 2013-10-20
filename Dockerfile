# Ghost
# VERSION	1.0
# See http://github.com/swenson/docker-ghost for source and license.

from ubuntu
maintainer Christopher Swenson <chris@caswenson.com>

# base ubuntu stuff
run echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
run apt-get update
run apt-get upgrade -y
run apt-get install -y unzip curl

# install node
run apt-get install -y python-software-properties
run add-apt-repository ppa:chris-lea/node.js
run apt-get update
run apt-get install -y nodejs

# install ghost
run curl -Lso /tmp/ghost.zip http://ghost.org/zip/ghost-0.3.3.zip
run mkdir -p ghost
run cd ghost && unzip -qq /tmp/ghost.zip && cd ..
run cd ghost && npm install --production

# use our ghost config file
add config.js ghost/config.js

# start ghost
entrypoint cd ghost && NODE_ENV=production npm start
expose 2368
