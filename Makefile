install: install-apt install-system install-iptables install-sudo install-ssh install-user install-tools install-vim install-tor install-vpn install-emercoin install-namecoin install-dns install-www

install-apt:
	make -C apt install

install-system:
	make -C system install

install-iptables:
	make -C iptables install

install-sudo:
	make -C sudo install

install-ssh:
	make -C ssh install

install-user:
	make -C user install

install-tools:
	apt-get install --yes bash-completion colordiff curl less

install-vim:
	make -C vim install

install-tor:
	make -C tor install

install-vpn:
	make -C vpn install

install-emercoin:
	make -C emercoin install

install-namecoin:
	make -C namecoin install

install-dns:
	make -C dns install

install-www:
	make -C www install
