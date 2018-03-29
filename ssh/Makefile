install: install-config

install-config: sshd_config
	install -o root -g root -m 644 $< /etc/ssh/sshd_config
