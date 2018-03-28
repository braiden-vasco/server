EMERCOIN_URL = 'https://downloads.sourceforge.net/project/emercoin/0.6.3.1/emercoin-0.6.3.1-linux64.tar.gz'
EMERCOIN_SHA256 = '5045f4c20a7060e610847f9ffd01048601266640007e97d9bc245202f59f5ef5'
NAMECOIN_URL = 'https://namecoin.org/files/namecoin-core-0.13.99-name-tab-beta1-notreproduced/namecoin-0.13.99-x86_64-linux-gnu.tar.gz'
NAMECOIN_SHA256 = '294b1106001d6ea2b9d9ee6a655021ef207a24e8f1dec8efd5899728b3849129'

install: install-emercoin install-namecoin

install-emercoin: install-emercoin-user install-emercoin-config install-emercoin-datadir install-emercoin-bins

install-namecoin: install-namecoin-user install-namecoin-config install-namecoin-datadir install-namecoin-bins

install-emercoin-user:
	adduser --system --group --no-create-home emercoin

install-namecoin-user:
	adduser --system --group --no-create-home namecoin

install-emercoin-config:
	install -o root -g root -m 755 -d /etc/emercoin
	install -o root -g root -m 644 emercoin.conf /etc/emercoin

install-namecoin-config:
	install -o root -g root -m 755 -d /etc/namecoin
	install -o root -g root -m 644 namecoin.conf /etc/namecoin

install-emercoin-datadir: install-emercoin-user
	install -o emercoin -g emercoin -m 755 -d /var/lib/emercoin

install-namecoin-datadir: install-namecoin-user
	install -o namecoin -g namecoin -m 755 -d /var/lib/namecoin

install-emercoin-bins: emercoind
	install -o root -g root -m 755 $< /usr/local/bin

install-namecoin-bins: namecoind
	install -o root -g root -m 755 $< /usr/local/bin

emercoind: emercoin.tar.gz
	tar -xzf $< -C . --strip-components=2 emercoin-0.6.3/bin/$@
	./$@ --version | grep 'Emercoin Core Daemon version v0.6.3.1emc'

namecoind: namecoin.tar.gz
	tar -xzf $< -C . --strip-components=2 namecoin-0.13.99/bin/$@
	./$@ --version | grep 'Namecoin Core Daemon version nc0.13.99-name-tab-beta1'

emercoin.tar.gz:
	wget $(EMERCOIN_URL) -O $@
	echo '$(EMERCOIN_SHA256) *$@' | sha256sum -c - || rm $@

namecoin.tar.gz:
	wget $(NAMECOIN_URL) -O $@
	echo '$(NAMECOIN_SHA256) *$@' | sha256sum -c - || rm $@
