# configure_system

Currently this is built for my Linux Mint setup. It should work with any Ubuntu derivative. 

One caveat: the Tilda terminal emulator I use is not compatible with Wayland, so if you're using Ubuntu make sure you're using X.org. It ships by default with Ubuntu 18.04 LTS.


## Usage

First download this repo. I put mine in my home directory.

### Configure a new computer

From the repo's root directory:
```bash
$ sh setup.sh
```

### Update config files

For when you updated your local config files and you want to reflect that in the repo.

From the repo's root directory:
```bash
$ sh update_dotfiles.sh
```
