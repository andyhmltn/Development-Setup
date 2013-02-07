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

##
# Directory setups
##
## -o flag to skip this
o=0
p=false

while getopts ":opt:" options
do
    case $options in
        o ) o=1
        ;;
        p ) opt2=true
        ;;
        t ) opt3=$OPTARG
        ;;
    esac
done

if [ $o -eq 0 ]
then
	## Create /local
	mkdir -p /local/www/applications
	mkdir -p /local/www/git
	mkdir -p /local/bin

	## Add /local/bin to the path
	echo "export $PATH=/local/bin:$PATH" >> ~/.bashrc
	echo "export $PATH=/local/bin:$PATH" >> ~deployer/.bashrc

	## Add the deployer user
	adduser deployer
	cd ~deployer

	## Link the /local/www folder to deployers home
	ln -s /local/www/applications apps
	ln -s /local/www/git

	chown -R deployer /local/www
fi
