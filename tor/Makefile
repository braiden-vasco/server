install: install-package install-config

install-package:
	apt-get install --yes tor

install-config: torrc
	install -o root -g root -m 644 $< /etc/tor/torrc
