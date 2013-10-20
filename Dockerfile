# Ghost
# VERSION	1.1
# See http://github.com/swenson/docker-ghost for usage, source, and license.

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

# delete the default content
run rm -rf /ghost/content

# link the user content and config in and start ghost
# patch 127.0.0.1 -> 0.0.0.0 to make it work inside docker
entrypoint cd ghost && sed -e 's/127\.0\.0\.1/0.0.0.0/g' /ghostdata/config.js > /ghost/config.js &&ln -s /ghostdata/content && NODE_ENV=production npm start
expose 2368
