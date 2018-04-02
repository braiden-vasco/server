install: install-apt install-system install-iptables install-sudo install-ssh install-user install-vim install-tor install-vpn install-emercoin install-namecoin install-ncdns install-dns install-www

install-apt:
	make -C apt install

install-system:
	./system.rb

install-iptables:
	./iptables.rb

install-sudo:
	./sudo.rb

install-ssh:
	./ssh.rb

install-user:
	./user.rb

install-vim:
	./vim.rb

install-tor:
	./tor.rb

install-vpn:
	./vpn.rb

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
