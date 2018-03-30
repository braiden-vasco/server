install: install-package install-alternatives install-vimrc

install-package:
	apt-get install --yes vim

install-alternatives:
	update-alternatives --set editor /usr/bin/vim.basic

install-vimrc: vimrc.local
	install -o root -g root -m 644 $< /etc/vim/vimrc.local
