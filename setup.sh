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

# Install oh-my-zsh plugins

# Syntax highlighting
sudo apt install zsh-syntax-highlighting

# Autocompletion
echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-completions/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-completions.list
curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-completions/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-completions.gpg > /dev/null
sudo apt update
sudo apt install zsh-completions

# Autosuggestions
echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-autosuggestions/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/shells:zsh-users:zsh-autosuggestions.list
curl -fsSL https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_zsh-users_zsh-autosuggestions.gpg > /dev/null
sudo apt update
sudo apt install zsh-autosuggestions


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
cp dotfiles/.tmux.conf ~/.tmux.conf # tmuc config file
cp dotfiles/.zshrc ~/.zshrc         # zsh config file
mkdir -p ~/bin
cp scripts/dropdown_alacritty.sh bin/ # terminal emulator config

# Install Python and associated dependencies
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.11
sudo apt install python-setuptools
sudo apt install python3-pip

# Poetry for Python environment management
curl -sSL https://install.python-poetry.org | python3 -
