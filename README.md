My Development Setup
=========

This is a (soon to be) set of scripts to setup my development environment on a new Ubuntu Server. Hopefully I'll migrate this over and start using Chef at some point, but I haven't had the chance to wrap my head around it just yet.

How to use
-----

Just run `sudo ./install.sh`

What does it install?
-----

 - Sqlite 3
 - Git
 - RBenv
 - Ruby Build
 - Ruby 1.9.3
 - Bundler
 - Rails

What else does it do?
-----

In my development setup, I have a user called 'deployer' and a folder called `/local/` that looks like this:

	/local/www/
	/local/www/apps/
	/local/www/git/
	/local/bin/

Everything in `/local/www/` gets symlinked to the deployers home directory (not the whole directory, just everything inside it)

So `/home/deployer/apps/` would go to `/local/www/apps/`

`/local/www/git/` is for git repositories.
`/local/www/apps/` is for production (or staging etc) applications that will be exposed to the web server.

`/local/bin/` is added to the path of both `root` and `deployer`

If you don't want the `/local/` folder and the deployer user just add `-o` as a flag when running `install.sh`. EG:

`./install.sh -o`
