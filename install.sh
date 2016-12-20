# Link dotfiles into the user's home directory
ln -svi "$HOME/dotfiles/.aliases" ~
ln -svi "$HOME/dotfiles/.bash_profile" ~
ln -svi "$HOME/dotfiles/.bashrc" ~
ln -svi "$HOME/dotfiles/.env" ~
ln -svi "$HOME/dotfiles/.gitconfig" ~
ln -svi "$HOME/dotfiles/.gitignore_global" ~
ln -svi "$HOME/dotfiles/.tools" ~
ln -svi "$HOME/dotfiles/.zshrc" ~

# Install some standard tools with Homebrew
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew tap cloudfoundry/tap
brew install bash-completion wget git mercurial maven cf-cli
brew install go || true
