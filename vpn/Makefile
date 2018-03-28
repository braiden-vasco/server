install: install-user install-package install-config

install-user:
	adduser --system --group --no-create-home openvpn

install-package:
	apt-get install --yes openvpn

install-config: openvpn.conf
	install -o root -g root -m 644 $< /etc/openvpn/openvpn.conf
