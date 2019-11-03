install: install-vim install-bash install-git

setup-instance:
	sudo apt install git vim curl tree terminator
	wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
	curl -sSL https://rvm.io/mpapis.asc | gpg --import
	curl -sSL https://rvm.io/pkuczynski.asc | gpg --import
	curl -sSL https://get.rvm.io | bash -s stable

install-vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc

install-bash:
	rm -f ~/.bashrc
	ln -s `pwd`/bash/bashrc ~/.bashrc

install-git:
	rm -f ~/.gitconfig
	ln -s `pwd`/git/gitconfig ~/.gitconfig
	rm -f ~/.gitignore
	ln -s `pwd`/git/gitignore ~/.gitignore
	git config --global core.excludesfile ~/.gitignore
	git submodule update --init --recursive
