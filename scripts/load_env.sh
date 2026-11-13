SOPS_AGE_KEY_FILE=$1

if [[ -f .sops.conf ]]; then
    . .sops.conf
else
    if [[ "$SOPS_AGE_KEY_FILE" == "" ]]; then
        echo please pass the location of the age key as arg1
        return
    fi

    if secret=$(age -d $SOPS_AGE_KEY_FILE | grep SECRET); then
        export SOPS_AGE_KEY=$secret
        export SOPS_CONFIG=$PWD/config/sops.yaml

        echo "export SOPS_AGE_KEY=$secret" > .sops.conf
        echo "export SOPS_CONFIG=$PWD/config/sops.yaml" >> .sops.conf
    else
        return
    fi
fi

if [[ ":$PATH:" != *":$PWD/scripts:"* ]]; then
    export PATH="$PWD/scripts:$PATH"
fi

alias svi="sops edit --input-type dotenv --output-type dotenv"
