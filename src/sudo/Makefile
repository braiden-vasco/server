install: install-package install-sudoers

install-package:
	apt-get install --yes sudo

install-sudoers: sudoers
	install -o root -g root -m 440 $< /etc/sudoers
