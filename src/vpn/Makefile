install: install-user install-package install-config install-data install-reload

install-user:
	adduser --system --group --no-create-home openvpn

install-package:
	apt-get install --yes openvpn

install-config: openvpn.conf
	install -o root -g root -m 644 $< /etc/openvpn/openvpn.conf

install-data:
	install -o root -g root -m 644 ca.crt     /etc/openvpn/ca.crt
	install -o root -g root -m 644 server.crt /etc/openvpn/server.crt
	install -o root -g root -m 644 dh2048.pem /etc/openvpn/dh2048.pem

install-reload:
	systemctl daemon-reload
