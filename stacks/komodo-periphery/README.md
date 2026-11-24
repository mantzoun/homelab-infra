Start up Komodo periphery container.

Need to set environment variable `PERIPHERY_SERVER=<periphery server name>`.
Need to set environment variable `CORE_SERVER=<core server ip:port>`. Default value is 192.168.1.7:9120
The server must be created in Komodo core before connecting the periphery.
The Komodo core public key must be copied to the location pointed to by `PERIPHERY_CORE_PUBLIC_KEYS`
After startup, copy the periphery public from container:/config/keys to the server config in Komodo

Start container with
`sops decrypt --output .env .enc.env && docker compose up -d`
Followed by a cleanup of the unencrypted .env file
`rm -f .env`

Host path `PERIPHERY_HOST_VOLUMES_ROOT` is mounted at the same point as in the host
This path is used to execute pre/post deployment scripts that may affect container volumes.
