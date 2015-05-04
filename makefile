.PHONY: install forceinstall

init:
	wget --no-check-certificate https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh
	sh install.sh && rm -f install.sh

install:
	ln -i -s .vim/vimrc ~/.vimrc

# references & notes:
# http://sontek.net/turning-vim-into-a-modern-python-ide
# http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule
# env GIT_SSL_NO_VERIFY=true
