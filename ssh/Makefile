install: install-config install-restart

install-config: sshd_config
	install -o root -g root -m 644 $< /etc/ssh/sshd_config

install-restart:
	systemctl restart ssh
