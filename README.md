# docker-ghost

Run the ghost blogging platform in a Docker container.

## Directions

Put your `config.js` file and your `content` folder in a folder together,
such as `ghostdata` (for your configuration, images, themes, plugins, etc.).

You want to mount this folder as `/ghostdata` when you run the Docker image.

```
docker run -d -v ~/ghostdata:/ghostdata swenson/ghost
```
