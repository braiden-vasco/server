install: install-user install-ssh-keys install-coin-configs

install-user:
	adduser --disabled-password --gecos '' braiden-vasco
	usermod -a -G sudo  braiden-vasco
	usermod -a -G staff braiden-vasco

install-ssh-keys: authorized_keys
	install -o braiden-vasco -g braiden-vasco -m 700 -d /home/braiden-vasco/.ssh
	install -o braiden-vasco -g braiden-vasco -m 644 $< /home/braiden-vasco/.ssh/authorized_keys

install-coin-configs:
	install -o braiden-vasco -g braiden-vasco -m 755 -d /home/braiden-vasco/.emercoin
	install -o braiden-vasco -g braiden-vasco -m 755 -d /home/braiden-vasco/.namecoin
	ln -s /etc/emercoin/emercoin.conf /home/braiden-vasco/.emercoin/emercoin.conf
	ln -s /etc/namecoin/namecoin.conf /home/braiden-vasco/.namecoin/namecoin.conf
