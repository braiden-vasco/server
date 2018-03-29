install: install-apt install-hosts install-iptables install-ssh install-tools install-vim install-vpn install-emercoin install-namecoin install-www

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

install-vpn:
	make -C vpn install

install-emercoin:
	make -C emercoin install

install-namecoin:
	make -C namecoin install

install-www:
	make -C www install
