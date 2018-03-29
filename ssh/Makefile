install: install-config install-keys

install-config: sshd_config
	install -o root -g root -m 644 $< /etc/ssh/sshd_config

install-keys: authorized_keys
	install -o braiden-vasco -g braiden-vasco -m 700 -d /home/braiden-vasco/.ssh
	install -o braiden-vasco -g braiden-vasco -m 644 $< /home/braiden-vasco/.ssh/authorized_keys
