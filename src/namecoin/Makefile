URL = 'https://namecoin.org/files/namecoin-core-0.13.99-name-tab-beta1-notreproduced/namecoin-0.13.99-x86_64-linux-gnu.tar.gz'
SHA256 = '294b1106001d6ea2b9d9ee6a655021ef207a24e8f1dec8efd5899728b3849129'

install: install-user install-config install-service install-datadir install-bins install-reload

install-user:
	adduser --system --group --no-create-home namecoin

install-config: namecoin.conf
	install -o root -g root -m 755 -d /etc/namecoin
	install -o root -g root -m 644 $< /etc/namecoin

install-service: namecoin.service
	install -o root -g root -m 644 $< /etc/systemd/system

install-datadir: install-user
	install -o namecoin -g namecoin -m 755 -d /var/lib/namecoin

install-bins: namecoind
	install -o root -g root -m 755 $< /usr/local/bin

install-reload:
	systemctl daemon-reload

namecoind: namecoin.tar.gz
	tar -xzf $< -C . --strip-components=2 namecoin-0.13.99/bin/$@
	./$@ --version | grep 'Namecoin Core Daemon version nc0.13.99-name-tab-beta1'

namecoin.tar.gz:
	wget $(URL) -O $@
	echo '$(SHA256) *$@' | sha256sum -c - || rm $@
