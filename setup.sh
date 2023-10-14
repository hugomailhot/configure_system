# Update OS
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt autoremove

# Install git
sudo apt install git

# Build essentials
sudo apt install build-essential
sudo apt install cmake
sudo apt install python3-dev

# Install zsh and oh-my-zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install tmux terminal multiplexer
sudo apt install tmux

# setup powerline fonts?
# no trace of that on my current system

# Install Neovim 
sudo apt install neovim

# Install other terminal essentials
sudo apt install tree
sudo apt install htop

# Copy repo dotfiles into their appropriate system locations
cp dotfiles/.tmux.conf ~/.tmux.conf    # tmuc config file
cp dotfiles/.vimrc ~/.vimrc            # vim config file
cp dotfiles/.zshrc ~/.zshrc            # zsh config file
cp dotfiles/config_0 ~/.config/tilda/  # tilda config file
cp dotfiles/.bash_aliases ~            # terminal aliases

# Install Python and associated dependencies
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.11
sudo apt install python-setuptools
sudo apt install python3-pip

# Poetry for Python environment management
curl -sSL https://install.python-poetry.org | python3 -

# Install powerline terminal bling $$$
pip3 install --user powerline-status
