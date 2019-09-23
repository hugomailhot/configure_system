# Update OS
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt autoremove

# Install git
sudo apt install git

# Install zsh and oh-my-zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Tilda terminal emulator
sudo apt install tilda

# Install tmux terminal multiplexer
sudo apt install tmux

# Install powerline terminal bling $$$
pip install --user powerline-status

# setup powerline fonts?
# no trace of that on my current system

# Install Vim with system clipboard support
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim-gtk3

# Install other terminal essentials
sudo apt tree
sudo apt htop

# Remove crappy bluetooth support, install actual bluetooth support
sudo apt purge blueberry
sudo apt install blueman

# Copy repo dotfiles into their appropriate system locations
cp dotfiles/.tmux.conf ~/.tmux.conf    # tmuc config file
cp dotfiles/.vimrc ~/.vimrc            # vim config file
cp dotfiles/.zshrc ~/.zshrc            # zsh config file
cp dotfiles/config_0 ~/.config/tilda/  # tilda config file
cp dotfiles/.bash_aliases ~            # terminal aliases

# Install Python and associated dependencies
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.7
sudo apt install python3-dev

# Poetry for Python environment management
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python

# Install messaging apps
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
sudo apt install ./slack-desktop-*.deb
