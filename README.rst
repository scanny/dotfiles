###############
scanny/dotfiles
###############

Using
=====

1. Install `zsh` if required

   Ubuntu::

    $ sudo apt-get -y install zsh

   CentOS::

    $ sudo yum update && sudo yum -y install zsh

2. Change user shell to `zsh`::

    $ sudo chsh -s /usr/bin/zsh

2. Clone `scanny/dotfiles` from GitHub::

    $ git clone https://github.com/scanny/dotfiles ~/.dotfiles

3. Run install script to establish symlinks and bootstrap downloads and/or
   installs::

    $ ~/.dotfiles/install.sh

4. Run :BundleInstall from inside Vim to install plugins

5. Install virtualenvwrapper::

    $ sudo pip install virtualenvwrapper


Features
========

* [X] .dotfiles is git repo
* [X] .vim/bundles is in .gitignore, managed locally
* [X] Script for auto setup, linking of items, etc.
* [ ] ? Have a bin/ dir? Maybe link selected executables.


TODO
====

* [X] Push to replace current GitHub version
* [X] Work out how to do platform-specific customizations to .vimrc
* [X] Try out on Cygwin and make necessary platform-specific script changes


Reasons I care about
====================

Keeping dotfiles under version control (git)
--------------------------------------------

You never know when you might need something later. Plus, it's interesting to
see how the collection of dotfiles evolves. A very useful benefit arises when
you can't remember just how you added frombobulation way back when. With the
git log, if you were a little careful about your commits, you can find exactly
the changes that were required.


Maintaining an off-site backup
------------------------------

Hard disks fail. Even SSDs. I don't want to keep this under Dropbox because it
might need to accommodate machine-local customizations.


Easy synchronization between machines
-------------------------------------

When I take my laptop out on the road, it would be nice if I could get all the
latest updates without too much trouble. I never seem to have much time to fuss
with it, always in a bit of a rush when heading out on the road.



Reasons I don't care about (yet)
================================

Rapidly installing a new machine from scratch
---------------------------------------------

I just don't do it enough to make it worth the trouble. Yet, anyway.
