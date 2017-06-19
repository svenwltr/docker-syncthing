# docker-syncthing

[![MIT license](https://img.shields.io/github/license/svenwltr/docker-syncthing.svg?maxAge=2592000&style=flat-square)](https://github.com/svenwltr/docker-syncthing/blob/master/LICENSE) [![GitHub tag](https://img.shields.io/github/release/svenwltr/docker-syncthing.svg?maxAge=2592000&style=flat-square)](https://github.com/svenwltr/docker-syncthing/releases) [![Docker Stars](https://img.shields.io/docker/stars/svenwltr/syncthing.svg?maxAge=2592000&style=flat-square)](https://hub.docker.com/r/svenwltr/syncthing/) [![Docker Pulls](https://img.shields.io/docker/pulls/svenwltr/syncthing.svg?maxAge=2592000&style=flat-square)](https://hub.docker.com/r/svenwltr/syncthing/) [![ImageLayers Size](https://img.shields.io/imagelayers/image-size/svenwltr/syncthing/latest.svg?maxAge=2592000&style=flat-square)](https://imagelayers.io/?images=svenwltr%2Fsyncthing) [![ImageLayers Layers](https://img.shields.io/imagelayers/layers/svenwltr/syncthing/latest.svg?maxAge=2592000&style=flat-square)](https://imagelayers.io/?images=svenwltr%2Fsyncthing)

Alpine based Docker image for [syncthing](https://syncthing.net/).

* based on `alpine:edge`
* persistent data is stored to `/data`
  + configuration in `/data/config`
  + storing files to `/data/files` is recommended
* GUI automatically opened to every interface
* images tags equal syncthing versions


## Example

```bash
docker run \
	--volume my-data-path:/data
	-p 8384 \
	-p 22000:22000 \
	-p 21027:21027/udp \
	svenwltr/syncthing
```


## Troubleshooting

* write an issue on GitHub
* ask me directly via email


## FAQ

### Devices can't connect

By default, Syncthing use uPNP to bypass NAT. If you don't want to run a uPNP server, [expose 2 ports](https://docs.syncthing.net/users/firewall.html#local-firewall):

`-p 22000:22000 -p 21027:21027/udp`
