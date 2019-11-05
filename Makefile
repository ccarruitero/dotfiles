install: install-vim install-bash install-git

setup-instance:
	sudo apt install git vim curl tree terminator
	wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
	curl -sSL https://rvm.io/mpapis.asc | gpg --import
	curl -sSL https://rvm.io/pkuczynski.asc | gpg --import
	curl -sSL https://get.rvm.io | bash -s stable

setup-firefox:
	sudo apt install mercurial
	mkdir -p ~/moz
	hg clone https://hg.mozilla.org/mozilla-central --cwd ~/moz
	cd ~/moz/mozilla-central && ./mach bootstrap

setup-rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	rustup install nightly
	rustup default nightly
	rustup target add wasm32-unknown-unknown
	curl https://get.wasmer.io -sSfL | sh

setup-android:
	mkdir -p ~/android-sdk
	wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip -P ~/android-sdk
	unzip ~/android-sdk/platform-tools-latest-linux.zip -d ~/android-sdk
	rm ~/android-sdk/platform-tools-latest-linux.zip

setup-geckodriver:
	wget https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz -P ~/Downloads
	tar -xzf ~/Downloads/geckodriver-v0.26.0-linux64.tar.gz -C ~/Downloads
	rm ~/Downloads/geckodriver-v0.26.0-linux64.tar.gz

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
