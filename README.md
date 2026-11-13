# Home Lab Infrastructure Repo
## Purpose

This repository will hold Docker Compose files and service configuration files. Secrets will be kept encoded in `.enc.env` files. No unencrypted `.env` files will be committed to this repository.

This repository will be provided to a Komodo manager, which will take care of container deployment. Since most containers use external host-mounted volumes, preparation of the volumes must be performed prior to deployment, ideally in the pre-deployment scripts.

Secrets in the `.enc.env` files will be encoded pre-commit using `sops`. A pre-commit hook will check for unencrypted files, but there is no plan for a pre-commit hook to automatically encrypt the files.

## Preparation

In order to work with the repository, `sops` and `age` utilities need to be installed.

After cloning the repo, execute `scripts/git_hook_setup.sh` to set up the Git hooks.

To encrypt/decrypt with `sops`, you will need to set the following parameters:
`SOPS_AGE_KEY=<sops secret key>`
`SOPS_CONFIG=<sops config yaml>`

The config YAML file with the public encryption key is committed to the repository under `config/`.

The private encryption key can be derived from the `sops` age key file. The `load_env.sh` utility can help retrieve the key and will save it in `.sops.conf`.

The private age key must be kept outside the repository. For local use, export it as `SOPS_AGE_KEY` in your shell session or load it from a secure local secret store. Do not commit the private key or keep it in a repo-local config file.

## Encoding/decoding dotenv files
 * `sops_encode.sh` will encode all `.env` files in the current directory to `.enc.env` files
 * `sops_decode.sh` will decode all `.enc.env` files in the current directory to `.env` files
 * `svi <file>` is an alias to edit `<file>` in place

Editing in place is preferable, because it minimizes the diff from one version to the next.
```
homelab-infra/
├── README.md
├── scripts/
├── config/
└── stacks/
    ├── stackA/
    │   ├── docker-compose.yml
    │   ├── .enc.env
    │   └── config/
    │       ├── service1
    │       └── service2
    ├── stackB
    │   ├── docker-compose.yml
    │   ├── .enc.env
    │   └── config/
    │      ├── service1
    │      └── service2
```
