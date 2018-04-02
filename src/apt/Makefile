install: install-sources install-noinstall install-update install-upgrade install-dist-upgrade install-purge install-autoremove install-upgrades

install-sources:
	install -o root -g root -m 644 ../../files/apt/sources.list /etc/apt/sources.list

install-noinstall:
	install -o root -g root -m 644 ../../files/apt/02noinstall /etc/apt/apt.conf.d/02noinstall

install-update:
	apt-get update

install-upgrade:
	apt-get upgrade --yes

install-dist-upgrade:
	apt-get dist-upgrade --yes

install-purge:
	apt-get purge --yes exim4 exim4-base exim4-config exim4-daemon-light rpcbind

install-autoremove:
	apt-get autoremove --purge --yes

install-upgrades:
	apt-get install --yes unattended-upgrades
	install -o root -g root -m 644 ../../files/apt/20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades
