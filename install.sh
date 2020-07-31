BASEDIR=$( cd "$(dirname "$0")" ; pwd -P )

# Link dotfiles into the user's home directory
ln -svi "$BASEDIR/.aliases" ~
ln -svi "$BASEDIR/.bash_profile" ~
ln -svi "$BASEDIR/.bashrc" ~
ln -svi "$BASEDIR/.env" ~
ln -svi "$BASEDIR/.gitconfig" ~
ln -svi "$BASEDIR/.gitignore_global" ~
ln -svi "$BASEDIR/.plugins" ~
ln -svi "$BASEDIR/.zshrc" ~
ln -svi "$BASEDIR/.tmux.conf" ~
ln -svi "$BASEDIR/.tmux.mac.conf" ~

# Install some standard tools with Homebrew
xcode-select --install

# Install Homebrew for package management
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew tap homebrew/cask-cask

brew install bash-completion wget git maven
brew install go || true
brew install tmux || true

brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk11

brew tap homebrew/cask-fonts
brew cask install font-fira-code

brew tap cloudfoundry/tap
brew install cf-cli || true

# Install NVM for node management
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

# Install the git cred-alert hooks
wget https://s3.amazonaws.com/cred-alert/cli/current-release/cred-alert-cli_darwin -O /usr/local/bin/cred-alert-cli
chmod +x /usr/local/bin/cred-alert-cli
cred-alert-cli update
mkdir -p $HOME/projects/pivotal-cf
git clone https://github.com/pivotal-cf/git-hooks-core.git $HOME/projects/pivotal-cf/git-hooks-core

git -C $BASEDIR submodule init
git -C $BASEDIR submodule update
