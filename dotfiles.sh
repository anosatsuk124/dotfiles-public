#! /bin/sh

if [ "$1" = 'install' ] ; then
	# echo 'Please enter install command:'
	# echo 'neovim tmux curl git'
	# read -p ">> " install_command && sudo su -c "$install_command"
	# if [ -f ~/.ssh/id_ed25519 ] ; then
	# 	mv ~/.ssh/id_ed25519 $(pwd)/.ssh/
	# 	mv ~/.ssh/id_ed25519.pub $(pwd)/.ssh/
	# else
	# 	ssh-keygen -t ed25519 -N '' -f $(pwd)/.ssh/id_ed25519
	# fi
	if [ -f ~/.config ] ; then
		cp -r $(pwd)/.config/* ~/.config
		cp -r ~/.config/* $(pwd)/.config
		rm -rf ~/.config
	fi
	# if [ -f ~/.ssh/config ] ; then
	# 	cat ~/.ssh/config >> $(pwd)/.ssh/config
	# fi
	# if [ -f ~/.ssh/authorized_keys ] ; then
	# 	mv ~/.ssh/authorized_keys $(pwd)/.ssh/authorized_keys
	# fi
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	for dot in .??*
	do
		if [ -d ~/$dot ] ; then
			rm -rf ~/$dot
		fi
		if [ -f ~/$dot ] ; then
			rm -f ~/$dot
		fi
		ln -s "$(pwd)/$dot" ~/
	done
	rm -rf ~/.git ~/.gitignore
	if [ $(which $SHELL) = $(which bash) ] ; then
		if [ -f ~/.profile ] ; then
			echo 'set -o vi'  >> ~/.profile
			echo 'export EDITOR=nvim' >> ~/.profile
			. ~/.profile
		elif [ -f ~/.bash_profile ] ; then
			echo 'set -o vi' >> ~/.bash_profile
			echo 'export EDITOR=nvim' >> ~/.bash_profile
			. ~/.bash_profile
		else
			read -p "Please enter your shell profile location: " profile_location
			echo 'set -o vi' >> "$profile_location"
			echo 'export EDITOR=nvim' >> "$profile_location"
			. "$profile_locaiton"
		fi
	elif [ $(which $SHELL) = $(which fish) ] ; then
		fish -c fish_vi_key_bindings
	fi
	# git config --global user.email 'anosatsuk124@gmail.com'
	# git config --global user.name 'Satsuki Akiba'
  mkdir ~/.dein
	sh nvim_installer.sh ~/.dein
	echo 'Copy and Paste to Github: '
	cat ~/.ssh/*.pub
fi
if [ "$1" = 'deploy' ] ; then
	git add .
	read -p 'Enter commit comment: '  comment && git commit -m "$comment"
	git push
fi
if [ "$1" = 'update' ] ; then
	if [ -f ~/.config ] ; then
		cp -r $(pwd)/.config/* ~/.config
		cp -r ~/.config/* $(pwd)/.config
		rm -rf ~/.config
	fi
	# if [ -f ~/.ssh/id_ed25519 ] ; then
	# 	mv ~/.ssh/id_ed25519 $(pwd)/.ssh/
	# 	mv ~/.ssh/id_ed25519.pub $(pwd)/.ssh/
	# fi
	# if [ -f ~/.ssh/config ] ; then
	# 	cat ~/.ssh/config >> $(pwd)/.ssh/config
	# fi
	# if [ -f ~/.ssh/authorized_keys ] ; then
	# 	mv ~/.ssh/authorized_keys $(pwd)/.ssh/authorized_keys
	# fi
	for dot in .??*
	do
		if [ -d ~/$dot ] ; then
			rm -rf ~/$dot
		fi
		if [ -f ~/$dot ] ; then
			rm -f ~/$dot
		fi
		ln -s $(pwd)/"$dot" ~/
	done
	rm -rf ~/.git
  mkdir ~/.dein
	sh nvim_installer.sh ~/.dein
fi
