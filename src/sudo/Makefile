install: install-package install-sudoers

install-package:
	apt-get install --yes sudo

install-sudoers: ../../files/sudoers
	install -o root -g root -m 440 $< /etc/sudoers
