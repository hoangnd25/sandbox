#!/bin/bash
echo "------------------------------------------------------------"
echo "INSTALL OH-MY-ZSH"
if [ ! -d "/home/vagrant/.oh-my-zsh" ]; then
	echo "oh-my-zsh not found"
	echo "Installing oh-my-zsh"
	sudo -H -u vagrant bash -c 'wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh'
else	
	echo "oh-my-zsh already installed"
fi	
sudo chsh -s $(which zsh) vagrant
echo "Done"

echo "------------------------------------------------------------"
echo "GET/UPDATE CONFIG FILES"
if [ -d "/home/vagrant/sandbox_config" ]; then
	echo "sandbox_config folder is exist"
	cd /home/vagrant/sandbox_config
	echo "Try to pull"
	sudo git pull
	cd
else
	echo "sandbox_config folder is NOT exist"
	echo "Clone repo"
	sudo git clone https://github.com/hoangnd25/sandbox_config.git /home/vagrant/sandbox_config
fi
echo "Done"

echo "------------------------------------------------------------"
echo "COPY CONFIG FILES"
cp -f /home/vagrant/sandbox_config/zsh/zshrc /home/vagrant/.zshrc
cp -f /home/vagrant/sandbox_config/zsh/themes/frosted.zsh-theme /home/vagrant/.oh-my-zsh/themes/frosted.zsh-theme
echo "Done"