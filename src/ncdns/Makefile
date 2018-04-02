NCDNS_URL = 'https://github.com/namecoin/ncdns/releases/download/v0.0.5/ncdns-v0.0.5-linux_amd64.tar.gz'
NCDNS_SHA256 = '55f6f5bc46f1f85369a8540e6174e9b845e24b424ba6679c56c34841b1128517'

install: install-user install-bins install-config install-service install-reload

install-user:
	adduser --system --group --no-create-home ncdns

install-bins: ncdns
	install -o root -g root -m 755 $< /usr/local/bin/ncdns

ncdns: ncdns.tar.gz
	tar -xzf $< -C . --strip-components=2 ncdns-v0.0.5-linux_amd64/bin/ncdns
	./$@ -version | grep 'go version go1.8.3 linux/amd64 gc cgo=true' || (rm $@ && false)

ncdns.tar.gz:
	wget $(NCDNS_URL) -O $@
	echo '$(NCDNS_SHA256) *$@' | sha256sum -c - || (rm $@ && false)

install-config: ../../files/ncdns/ncdns.conf
	install -o root -g root -m 755 -d /etc/ncdns
	install -o root -g root -m 644 $< /etc/ncdns/ncdns.conf

install-service: ../../files/ncdns/ncdns.service
	install -o root -g root -m 644 $< /etc/systemd/system/ncdns.service

install-reload:
	systemctl daemon-reload
