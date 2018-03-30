install: install-package install-config install-hidden-services

install-package:
	apt-get install --yes tor

install-config: torrc
	install -o root -g root -m 644 $< /etc/tor/torrc

install-hidden-services:
	install -o debian-tor -g debian-tor -m 700 -d       /var/lib/tor/hidden_services
	install -o debian-tor -g debian-tor -m 700 -d       /var/lib/tor/hidden_services/random
	install -o debian-tor -g debian-tor -m 600 hostname /var/lib/tor/hidden_services/random/hostname
