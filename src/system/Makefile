install: install-sysctl install-hostname install-hosts

install-sysctl: ../../files/system/sysctl.conf
	install -o root -g root -m 644 $< /etc/sysctl.d/00-sysctl.conf
	sysctl -p $<

install-hostname: ../../files/system/hostname
	install -o root -g root -m 644 $< /etc/hostname

install-hosts: ../../files/system/hosts
	install -o root -g root -m 644 $< /etc/hosts
