install: install-package install-config install-resolvconf

install-package:
	apt-get install --yes dnsmasq

install-config: ../../files/dns/dnsmasq.conf
	install -o root -g root -m 755 $< /etc/dnsmasq.conf

install-resolvconf: ../../files/resolv.conf
	install -o root -g root -m 644 $< /etc/resolv.conf
