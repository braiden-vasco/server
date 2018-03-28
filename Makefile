install: install-apt install-iptables install-emercoin install-namecoin

install-apt:
	make -C apt install

install-iptables:
	make -C iptables install

install-emercoin:
	make -C emercoin install

install-namecoin:
	make -C namecoin install
