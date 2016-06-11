# docker-syncthing

Alpine based Docker image for syncthing

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
	svenwltr/syncthing
```


## Troubleshooting

* write an issue on GitHub
* ask me directly via email


## FAQ

*No one asked me a thing ...*
