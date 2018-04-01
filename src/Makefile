install: install-apt install-system install-iptables install-sudo install-ssh install-user install-tools install-vim install-tor install-vpn install-emercoin install-namecoin install-ncdns install-dns install-www

install-apt:
	make -C apt install

install-system:
	./system.rb

install-iptables:
	./iptables.rb

install-sudo:
	make -C sudo install

install-ssh:
	make -C ssh install

install-user:
	./user.rb

install-tools:
	apt-get install --yes bash-completion colordiff curl less

install-vim:
	make -C vim install

install-tor:
	./tor.rb

install-vpn:
	make -C vpn install

install-emercoin:
	make -C emercoin install

install-namecoin:
	make -C namecoin install

install-ncdns:
	make -C ncdns install

install-dns:
	./dns.rb

install-www:
	make -C www install
