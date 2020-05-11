.PHONY: init
init:
	wget --no-check-certificate https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh
	sh install.sh && rm -f install.sh

.PHONY: install
install:
	ln -i -s .vim/vimrc ~/.vimrc

# references & notes:
# env GIT_SSL_NO_VERIFY=true
