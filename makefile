BUNDLE_DIR=~/.vim/bundle/you-complete-me/

.PHONY: init install ycm_update ycm ycm_clang

init:
	wget --no-check-certificate https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh
	sh install.sh && rm -f install.sh

install:
	ln -i -s .vim/vimrc ~/.vimrc

ycm_update:
	cd $(BUNDLE_DIR) && git submodule update --init --recursive

ycm_clean:
	cd $(BUNDLE_DIR) && git clean -ffxd

ycm: ycm_update
	cd $(BUNDLE_DIR) && python ./install.py

ycm_clang: ycm_update
	cd $(BUNDLE_DIR) && python ./install.py --clang-completer

# references & notes:
# env GIT_SSL_NO_VERIFY=true
