BUNDLE_DIR=~/.vim/bundle/you-complete-me/

.PHONY: init
init:
	wget --no-check-certificate https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh
	sh install.sh && rm -f install.sh

.PHONY: install
install:
	ln -i -s .vim/vimrc ~/.vimrc

.PHONY: ycm-update
ycm-update:
	cd $(BUNDLE_DIR) && git submodule update --init --recursive

.PHONY: ycm-update
ycm-clean:
	cd $(BUNDLE_DIR) && git clean -ffxd

.PHONY: ycm-
ycm-: ycm_update
	cd $(BUNDLE_DIR) && python ./install.py

.PHONY: ycm-clang
ycm-clang: ycm_update
	cd $(BUNDLE_DIR) && python ./install.py --clang-completer

# references & notes:
# env GIT_SSL_NO_VERIFY=true
