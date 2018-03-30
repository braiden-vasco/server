install: install-sources install-noinstall install-update install-upgrade install-dist-upgrade install-purge install-autoremove install-upgrades

install-sources: sources.list
	install -o root -g root -m 644 $< /etc/apt

install-noinstall: 02noinstall
	install -o root -g root -m 644 $< /etc/apt/apt.conf.d

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

install-upgrades: 20auto-upgrades
	apt-get install --yes unattended-upgrades
	install -o root -g root -m 644 $< /etc/apt/apt.conf.d
