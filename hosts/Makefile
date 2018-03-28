install: install-hostname install-hosts

install-hostname: hostname
	install -o root -g root -m 644 $< /etc/hostname

install-hosts: hosts
	install -o root -g root -m 644 $< /etc/hosts
