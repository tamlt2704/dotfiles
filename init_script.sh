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
}

for var in "$@"
do
	if test "$var" = "update"; then update; fi
	if test "$var" = "install_basic"; then install_basic; fi
	if test "$var" = "python_basic"; then python_basic; fi
	if test "$var" = "python_libs"; then python_libs; fi
	if test "$var" = "zsh_shell"; then zsh_shell; fi
done
