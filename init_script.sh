# apt-get update && apt install -y vim tmux htop zsh git python

update()
{
	apt-get update
}

install_basic()
{
	apt install -y vim tmux htop zsh git python3 python3-distutils curl wget sudo
}

python_basic()
{
	apt install -y python3 python-pip
	pip install virtualenv
}

python_libs()
{
	pip install pandas matplotlib ipython flask django jupyter notebook
}

zsh_shell()
{
	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
	chsh -s $(which zsh)
}

java_dev()
{
	apt install -y maven
	apt install -y maven openjdk-8-jdk
    update-alternatives --config java
}

setup_vim()
{
	# vim color
	mkdir -p ~/.vim/colors && cd ~/.vim/colors
	wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400

	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

	cd ~/.vim/bundle
	git clone git://github.com/Lokaltog/vim-powerline.git
	git clone https://github.com/kien/ctrlp.vim.git

	curl -so ~/.vimrc https://raw.githubusercontent.com/tamlt2704/dotfiles/master/vimrc
}


for var in "$@"
do
	if test "$var" = "update"; then update; fi
	if test "$var" = "install_basic"; then install_basic; fi
	if test "$var" = "python_basic"; then python_basic; fi
	if test "$var" = "python_libs"; then python_libs; fi
	if test "$var" = "zsh_shell"; then zsh_shell; fi
	if test "$var" = "java_dev"; then java_dev; fi
	if test "$var" = "setup_vim"; then setup_vim; fi
done
