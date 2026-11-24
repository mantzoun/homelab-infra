# Navidrome Setup
## Preparation
### Mount points
The compose file requires the following shell variables in order to properly set up the container volumes.
* `HOST_VOLUME_ROOT`: The host root folder for container volumes, e.g. `/opt/docker`
* `NAVIDROME_ROOT`: The subfolder under `HOST_VOLUME_ROOT` that will hold the service data. Default value is `navidrome`
* `NAVIDROME_MUSIC`: The folder containing the actual music files.

### Adding to a network
In case the container needs to be added to a specific network, e.g. a reverse proxy network, set shell variable
* `NAVIDROME_NETWORK`: Network to add the container to. Default value is `navidrome-net`

The network is declared as external in the docker compose file, so it must be creted before spinning up the container.

## Configuration
If required, set the following configuration variables
* `NAVIDROME_PORT`: Service listening port. Default value is `4533`

## Deployment
Start the container with <br>
`docker compose up -d`
