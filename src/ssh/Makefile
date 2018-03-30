install: install-config install-pubkeys

install-config: ../../files/ssh/sshd_config
	install -o root -g root -m 644 $< /etc/ssh/sshd_config

install-pubkeys:
	install -o root -g root -m 644 ../../files/ssh/ssh_host_dsa_key.pub     /etc/ssh/ssh_host_dsa_key.pub
	install -o root -g root -m 644 ../../files/ssh/ssh_host_ecdsa_key.pub   /etc/ssh/ssh_host_ecdsa_key.pub
	install -o root -g root -m 644 ../../files/ssh/ssh_host_ed25519_key.pub /etc/ssh/ssh_host_ed25519_key.pub
	install -o root -g root -m 644 ../../files/ssh/ssh_host_key.pub         /etc/ssh/ssh_host_key.pub
	install -o root -g root -m 644 ../../files/ssh/ssh_host_rsa_key.pub     /etc/ssh/ssh_host_rsa_key.pub
