EMERCOIN_URL = 'https://downloads.sourceforge.net/project/emercoin/0.6.3.1/emercoin-0.6.3.1-linux64.tar.gz'
EMERCOIN_SHA256 = '5045f4c20a7060e610847f9ffd01048601266640007e97d9bc245202f59f5ef5'

NAMECOIN_URL = 'https://namecoin.org/files/namecoin-core-0.13.99-name-tab-beta1-notreproduced/namecoin-0.13.99-x86_64-linux-gnu.tar.gz'
NAMECOIN_SHA256 = '294b1106001d6ea2b9d9ee6a655021ef207a24e8f1dec8efd5899728b3849129'

NCDNS_URL = 'https://github.com/namecoin/ncdns/releases/download/v0.0.5/ncdns-v0.0.5-linux_amd64.tar.gz'
NCDNS_SHA256 = '55f6f5bc46f1f85369a8540e6174e9b845e24b424ba6679c56c34841b1128517'

install-emercoin: install-emercoin-user install-emercoin-config install-emercoin-service install-emercoin-datadir install-emercoin-bins install-emercoin-reload
install-namecoin: install-namecoin-user install-namecoin-config install-namecoin-service install-namecoin-datadir install-namecoin-bins install-namecoin-reload
install-ncdns: install-ncdns-user install-ncdns-bins install-ncdns-config install-ncdns-service install-ncdns-reload

install-emercoin-user:
	adduser --system --group --no-create-home emercoin

install-emercoin-config:
	install -o root -g root -m 755 -d /etc/emercoin
	install -o root -g root -m 644 ../../files/emercoin/emercoin.conf /etc/emercoin/emercoin.conf

install-emercoin-service:
	install -o root -g root -m 644 ../../files/emercoin/emercoin.service /etc/systemd/system/emercoin.service

install-emercoin-datadir: install-emercoin-user
	install -o emercoin -g emercoin -m 755 -d /var/lib/emercoin

install-emercoin-bins:
	install -o root -g root -m 755 emercoind /usr/local/bin

install-emercoin-reload:
	systemctl daemon-reload

emercoind:
	tar -xzf emercoin.tar.gz -C . --strip-components=2 emercoin-0.6.3/bin/$@
	./$@ --version | grep 'Emercoin Core Daemon version v0.6.3.1emc'

emercoin.tar.gz:
	wget $(EMERCOIN_URL) -O $@
	echo '$(EMERCOIN_SHA256) *$@' | sha256sum -c - || rm $@

install-namecoin-user:
	adduser --system --group --no-create-home namecoin

install-namecoin-config:
	install -o root -g root -m 755 -d /etc/namecoin
	install -o root -g root -m 644 ../../files/namecoin/namecoin.conf /etc/namecoin/namecoin.conf

install-namecoin-service:
	install -o root -g root -m 644 ../../files/namecoin/namecoin.service /etc/systemd/system/namecoin.service

install-namecoin-datadir: install-namecoin-user
	install -o namecoin -g namecoin -m 755 -d /var/lib/namecoin

install-namecoin-bins:
	install -o root -g root -m 755 namecoind /usr/local/bin

install-namecoin-reload:
	systemctl daemon-reload

namecoind:
	tar -xzf namecoin.tar.gz -C . --strip-components=2 namecoin-0.13.99/bin/$@
	./$@ --version | grep 'Namecoin Core Daemon version nc0.13.99-name-tab-beta1'

namecoin.tar.gz:
	wget $(NAMECOIN_URL) -O $@
	echo '$(NAMECOIN_SHA256) *$@' | sha256sum -c - || rm $@

install-ncdns-user:
	adduser --system --group --no-create-home ncdns

install-ncdns-bins:
	install -o root -g root -m 755 ncdns /usr/local/bin/ncdns

ncdns:
	tar -xzf ncdns.tar.gz -C . --strip-components=2 ncdns-v0.0.5-linux_amd64/bin/ncdns
	./$@ -version | grep 'go version go1.8.3 linux/amd64 gc cgo=true' || (rm $@ && false)

ncdns.tar.gz:
	wget $(NCDNS_URL) -O $@
	echo '$(NCDNS_SHA256) *$@' | sha256sum -c - || (rm $@ && false)

install-ncdns-config:
	install -o root -g root -m 755 -d /etc/ncdns
	install -o root -g root -m 644 ../../files/ncdns/ncdns.conf /etc/ncdns/ncdns.conf

install-ncdns-service:
	install -o root -g root -m 644 ../../files/ncdns/ncdns.service /etc/systemd/system/ncdns.service

install-ncdns-reload:
	systemctl daemon-reload
