Start up Komodo periphery container.

Need to set environment variable `PERIPHERY_SERVER=<periphery server name>`.
Need to set environment variable `CORE_SERVER=<core server ip:port>`. Default value is 192.168.1.7:9120
The server must be created in Komodo core before connecting the periphery.
The Komodo core public key must be copied to the location pointed to by `PERIPHERY_CORE_PUBLIC_KEYS`
After startup, copy the periphery public from container:/config/keys to the server config in Komodo

Start container without writing the decrypted .env to disk with
`sops --input-type dotenv --output-type dotenv exec-env .env.enc 'docker compose up -d'`
