install: install-package install-config install-restore

install-package:
	apt-get install --yes iptables-persistent

install-config: install-config-ipv4 install-config-ipv6

install-config-ipv4: ../../files/iptables/rules.v4
	install -o root -g root -m 644 $< /etc/iptables/rules.v4

install-config-ipv6: ../../files/iptables/rules.v6
	install -o root -g root -m 644 $< /etc/iptables/rules.v6

install-restore: install-restore-ipv4 install-restore-ipv6

install-restore-ipv4: ../../files/iptables/rules.v4
	cat $< | iptables-restore

install-restore-ipv6: ../../files/iptables/rules.v6
	cat $< | ip6tables-restore
