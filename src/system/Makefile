install: install-sysctl install-hostname install-hosts

install-sysctl: ../../files/sysctl.conf
	install -o root -g root -m 644 $< /etc/sysctl.d/00-sysctl.conf
	sysctl -p $<

install-hostname: ../../files/hostname
	install -o root -g root -m 644 $< /etc/hostname

install-hosts: ../../files/hosts
	install -o root -g root -m 644 $< /etc/hosts
