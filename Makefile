install: install-apt install-emercoin install-namecoin

install-apt:
	make -C apt install

install-emercoin:
	make -C emercoin install

install-namecoin:
	make -C namecoin install
