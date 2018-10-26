# Sound of Text

[Sound of Text](https://soundoftext.com) is a website built to help language
learners convert text into audio using Google's TTS Engine.

This repository is to help the maintainer, [Nick Pierson](https://nick.exposed),
deploy to soundoftext.com.

## Dependencies

In order to deploy, you will need to reveal the secrets in the repo.
You will need your GPG key.
You will also need to be added as a member of git secret.

### Install GPG

In most linux distros:

```
sudo apt-get install gpg
```

### Export private gpg key

On whatever machine you have your gpg key:

```
gpg --list-secret-keys # copy id (second column)
gpg --export-secret-keys $ID > private-key.asc
```

### Import private gpg key

On the machine in which you intend to deploy:

```
gpg --import private-key.asc
```

### Reveal secrets

```
git secret reveal
```

## Deploy

Deployment is ideally done through CI, but it can be done locally. Once you have
fulfilled all the dependencies, simply run:

```
./scripts/deploy.sh
```

## Test Run

If you want to run Sound of Text locally:

First, make sure you have fulfilled all dependencies, then run:

```
sudo mkdir -p /opt/traefik
sudo ln -s ./traefik.toml /opt/traefik/traefik.toml
sudo ln -s ./acme.json /opt/traefik/acme.json
./scripts/up.sh
```
