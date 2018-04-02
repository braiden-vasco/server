NAMECOIN_URL = 'https://namecoin.org/files/namecoin-core-0.13.99-name-tab-beta1-notreproduced/namecoin-0.13.99-x86_64-linux-gnu.tar.gz'
NAMECOIN_SHA256 = '294b1106001d6ea2b9d9ee6a655021ef207a24e8f1dec8efd5899728b3849129'

install-namecoin: install-namecoin-user install-namecoin-config install-namecoin-service install-namecoin-datadir install-namecoin-bins install-namecoin-reload

install-namecoin-user:
	adduser --system --group --no-create-home namecoin

install-namecoin-config: ../../files/namecoin/namecoin.conf
	install -o root -g root -m 755 -d /etc/namecoin
	install -o root -g root -m 644 $< /etc/namecoin/namecoin.conf

install-namecoin-service: ../../files/namecoin/namecoin.service
	install -o root -g root -m 644 $< /etc/systemd/system/namecoin.service

install-namecoin-datadir: install-namecoin-user
	install -o namecoin -g namecoin -m 755 -d /var/lib/namecoin

install-namecoin-bins: namecoind
	install -o root -g root -m 755 $< /usr/local/bin

install-namecoin-reload:
	systemctl daemon-reload

namecoind: namecoin.tar.gz
	tar -xzf $< -C . --strip-components=2 namecoin-0.13.99/bin/$@
	./$@ --version | grep 'Namecoin Core Daemon version nc0.13.99-name-tab-beta1'

namecoin.tar.gz:
	wget $(NAMECOIN_URL) -O $@
	echo '$(NAMECOIN_SHA256) *$@' | sha256sum -c - || rm $@
