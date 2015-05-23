[azukiapp/apache2](http://images.azk.io/#/apache2)
==================

Base docker image to run **PHP** applications in [`azk`](http://azk.io)

Versions (tags)
---

<versions>
- [`latest`, `2`, `2.4`, `2.4.7`](https://github.com/azukiapp/docker-apache2/blob/master/2.4/Dockerfile)
</versions>

Image content:
---

- Ubuntu 14.04
- Git
- VIM
- Apache with root enabled

### Usage with `azk`

Example of using this image with [azk](http://azk.io):

```js
/**
 * Documentation: http://docs.azk.io/Azkfile.js
 */
 
// Adds the systems that shape your system
systems({
  "my-app": {
    // Dependent systems
    depends: [], // postgres, mysql, mongodb ...
    // More images:  http://images.azk.io
    image: {"docker": "azukiapp/apache2"},
    // Steps to execute before running instances
    provision: [],
    workdir: "/azk/#{manifest.dir}",
    shell: "/bin/bash",
    command: "# command to run app",
    wait: {"retry": 20, "timeout": 1000},
    mounts: {
      '/azk/#{manifest.dir}': path("."),
    },
    scalable: {"default": 1},
    http: {
      // my-app.dev.azk.io
      domains: [ "#{system.name}.#{azk.default_domain}" ]
    },
    ports: {
      // exports global variables
      http: "80/tcp",
    },
    envs: {
      // set instances variables
      APP_DIR: "/azk/#{manifest.dir}",
    }
  },
});
```

### Usage with `docker`

To create the image `azukiapp/apache2`, execute the following command on the docker-apache2 folder:

```sh
$ docker build -t azukiapp/apache2 2.4/
```

To run the image and bind to port 80:

```sh
$ docker run -it --rm --name my-app -p 80:80 -v "$PWD":/myapp -w /myapp azukiapp/apache2 apache2-foreground
```

#### To run the sample project:

Start your image binding external port 80 in all interfaces to your container:

```sh
$ docker run -d -p 80:80 azukiapp/apache2
```

Test your deployment:

```sh
$ curl http://localhost/

Hello world!
```

Logs
---

```sh
# with azk
$ azk logs my-app

# with docker
$ docker logs <CONTAINER_ID>
```

## License

Azuki Dockerfiles distributed under the [Apache License](https://github.com/azukiapp/dockerfiles/blob/master/LICENSE).
