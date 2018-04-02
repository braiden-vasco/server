install:
	install -o root -g root -m 644 ../../files/apt/sources.list /etc/apt/sources.list
	install -o root -g root -m 644 ../../files/apt/02noinstall /etc/apt/apt.conf.d/02noinstall
	apt-get update
	apt-get upgrade --yes
	apt-get dist-upgrade --yes
	apt-get purge --yes exim4 exim4-base exim4-config exim4-daemon-light rpcbind
	apt-get autoremove --purge --yes
	apt-get install --yes unattended-upgrades
	install -o root -g root -m 644 ../../files/apt/20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades
