install: install-package install-config install-restore

install-package:
	apt-get install --yes iptables-persistent

install-config: install-config-ipv4 install-config-ipv6

install-config-ipv4: rules.v4
	install -o root -g root -m 644 $< /etc/iptables/$<

install-config-ipv6: rules.v6
	install -o root -g root -m 644 $< /etc/iptables/$<

install-restore: install-restore-ipv4 install-restore-ipv6

install-restore-ipv4: rules.v4
	cat $< | iptables-restore

install-restore-ipv6: rules.v6
	cat $< | ip6tables-restore
