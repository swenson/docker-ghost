docker-ghost
============

Run the ghost blogging platform in a Docker container.

Simply modify the `config.js` sample config file for your blog,
and build and launch the container.

Important note: you have to make sure that your `config.js` is set to listen on
`0.0.0.0` instead of `127.0.0.1`, or the port will not be forward correctly.

```
docker build -t ghost .
docker run -d ghost
```
