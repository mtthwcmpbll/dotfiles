BASEDIR=$( cd "$(dirname "$0")" ; pwd -P )

# Link dotfiles into the user's home directory
ln -svi "$BASEDIR/.aliases" ~
ln -svi "$BASEDIR/.bash_profile" ~
ln -svi "$BASEDIR/.bashrc" ~
ln -svi "$BASEDIR/.env" ~
ln -svi "$BASEDIR/.gitconfig" ~
ln -svi "$BASEDIR/.gitignore_global" ~
ln -svi "$BASEDIR/.tools" ~
ln -svi "$BASEDIR/.zshrc" ~

# Install some standard tools with Homebrew
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew tap cloudfoundry/tap
brew install bash-completion wget git mercurial maven rbenv
brew install cf-cli || true
brew install go || true

git -C $BASEDIR submodule init
git -C $BASEDIR submodule update
