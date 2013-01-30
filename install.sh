#!/bin/bash

# Update the package manager
apt-get update

# Install essentials
apt-get install build-essential zlib1g-dev git-core sqlite3 libsqlite3-dev

# GO HOME BASH YOU'RE DRUNK
cd

# Install rbenv
git clone git://github.com/sstephenson/rbenv.git .rbenv

# Install rbenv path
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

# Source the bash profile
source .bash_profile

# Install Ruby Build
git clone https://github.com/sstephenson/ruby-build.git
cd ruby-build
./install.sh

# Install ruby 1.9.3-p362
rbenv install 1.9.3-p362
rbenv global 1.9.3-p362

# Install bundler
gem install bundle
# Install rails
gem install rails
