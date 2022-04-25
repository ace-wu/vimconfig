.PHONY: install
install:
	mkdir -p ~/.config
	ln -i -s ../.vim ~/.config/nvim
	ln -i -s .vim/init.vim ~/.vimrc

# references & notes:
# env GIT_SSL_NO_VERIFY=true
