install: install-apt install-hosts install-iptables install-ssh install-tools install-vim install-emercoin install-namecoin

install-apt:
	make -C apt install

install-hosts:
	make -C hosts install

install-iptables:
	make -C iptables install

install-ssh:
	make -C ssh install

install-tools:
	apt-get install --yes bash-completion colordiff curl less

install-vim:
	make -C vim install

install-emercoin:
	make -C emercoin install

install-namecoin:
	make -C namecoin install
