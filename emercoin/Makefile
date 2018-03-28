URL = 'https://downloads.sourceforge.net/project/emercoin/0.6.3.1/emercoin-0.6.3.1-linux64.tar.gz'
SHA256 = '5045f4c20a7060e610847f9ffd01048601266640007e97d9bc245202f59f5ef5'

install: install-user install-config install-service install-datadir install-bins install-restart

install-user:
	adduser --system --group --no-create-home emercoin

install-config: emercoin.conf
	install -o root -g root -m 755 -d /etc/emercoin
	install -o root -g root -m 644 $< /etc/emercoin

install-service: emercoin.service
	install -o root -g root -m 644 $< /etc/systemd/system

install-datadir: install-user
	install -o emercoin -g emercoin -m 755 -d /var/lib/emercoin

install-bins: emercoind
	install -o root -g root -m 755 $< /usr/local/bin

install-restart:
	systemctl daemon-reload
	systemctl restart emercoin.service

emercoind: emercoin.tar.gz
	tar -xzf $< -C . --strip-components=2 emercoin-0.6.3/bin/$@
	./$@ --version | grep 'Emercoin Core Daemon version v0.6.3.1emc'

emercoin.tar.gz:
	wget $(URL) -O $@
	echo '$(SHA256) *$@' | sha256sum -c - || rm $@
