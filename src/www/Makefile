install: install-nginx install-index

install-nginx:
	apt-get install --yes nginx

install-index: ../../files/www/index.html
	install -o root -g root -m 644 $< /var/www/html/index.html
