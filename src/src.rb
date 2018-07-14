#!/usr/bin/env ruby
# frozen_string_literal: true

EMERCOIN_URL = 'https://downloads.sourceforge.net/project/emercoin/0.6.3.1/emercoin-0.6.3.1-linux64.tar.gz'
EMERCOIN_SHA256 = '5045f4c20a7060e610847f9ffd01048601266640007e97d9bc245202f59f5ef5'

NAMECOIN_URL = 'https://namecoin.org/files/namecoin-core-0.13.99-name-tab-beta1-notreproduced/namecoin-0.13.99-x86_64-linux-gnu.tar.gz'
NAMECOIN_SHA256 = '294b1106001d6ea2b9d9ee6a655021ef207a24e8f1dec8efd5899728b3849129'

NCDNS_URL = 'https://github.com/namecoin/ncdns/releases/download/v0.0.5/ncdns-v0.0.5-linux_amd64.tar.gz'
NCDNS_SHA256 = '55f6f5bc46f1f85369a8540e6174e9b845e24b424ba6679c56c34841b1128517'

def system!(*args)
  raise unless system(*args)
end

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/apt/sources.list', __dir__),
        '/etc/apt/sources.list'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/apt/02noinstall', __dir__),
        '/etc/apt/apt.conf.d/02noinstall'

system! 'apt-get update'
system! 'apt-get upgrade --yes'
system! 'apt-get dist-upgrade --yes'
system! 'apt-get purge --yes exim4 exim4-base exim4-config exim4-daemon-light rpcbind'
system! 'apt-get autoremove --purge --yes'
system! 'apt-get install --yes unattended-upgrades'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/apt/20auto-upgrades', __dir__),
        '/etc/apt/apt.conf.d/20auto-upgrades'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/hostname', __dir__),
        '/etc/hostname'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/hosts', __dir__),
        '/etc/hosts'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/aliases', __dir__),
        '/etc/aliases'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/sysctl.conf', __dir__),
        '/etc/sysctl.d/00-sysctl.conf'

system! 'sysctl -p /etc/sysctl.d/00-sysctl.conf'

system! 'apt-get install --yes iptables-persistent'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/iptables/rules.v4'),
        '/etc/iptables/rules.v4'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/iptables/rules.v6'),
        '/etc/iptables/rules.v6'

system! 'cat /etc/iptables/rules.v4 | iptables-restore'
system! 'cat /etc/iptables/rules.v6 | ip6tables-restore'

system! 'apt-get install --yes sudo'

system! 'install', '-o', 'root', '-g', 'root', '-m', '440',
        File.expand_path('../files/sudoers', __dir__),
        '/etc/sudoers'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/ssh/sshd_config'),
        '/etc/ssh/sshd_config'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/ssh/ssh_host_dsa_key.pub'),
        '/etc/ssh/ssh_host_dsa_key.pub'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/ssh/ssh_host_ecdsa_key.pub'),
        '/etc/ssh/ssh_host_ecdsa_key.pub'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/ssh/ssh_host_ed25519_key.pub'),
        '/etc/ssh/ssh_host_ed25519_key.pub'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/ssh/ssh_host_key.pub'),
        '/etc/ssh/ssh_host_key.pub'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/ssh/ssh_host_rsa_key.pub'),
        '/etc/ssh/ssh_host_rsa_key.pub'

system! "id braiden-vasco || adduser --disabled-password --gecos '' braiden-vasco"

system! 'usermod -a -G sudo  braiden-vasco'
system! 'usermod -a -G staff braiden-vasco'

system! 'install', '-o', 'braiden-vasco', '-g', 'braiden-vasco', '-m', '700',
        '-d', '/home/braiden-vasco/.ssh'

system! 'install', '-o', 'braiden-vasco', '-g', 'braiden-vasco', '-m', '644',
        File.expand_path('../files/user/authorized_keys'),
        '/home/braiden-vasco/.ssh/authorized_keys'

system! 'install', '-o', 'braiden-vasco', '-g', 'braiden-vasco', '-m', '755',
        '-d', '/home/braiden-vasco/.emercoin'

system! 'install', '-o', 'braiden-vasco', '-g', 'braiden-vasco', '-m', '755',
        '-d', '/home/braiden-vasco/.namecoin'

system! 'ln -sf /etc/emercoin/emercoin.conf /home/braiden-vasco/.emercoin/emercoin.conf'
system! 'ln -sf /etc/namecoin/namecoin.conf /home/braiden-vasco/.namecoin/namecoin.conf'

system! 'apt-get install --yes bash-completion colordiff curl less'

system! 'apt-get install --yes vim'

system! 'update-alternatives --set editor /usr/bin/vim.basic'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/vim/vimrc.local'),
        '/etc/vim/vimrc.local'

system! 'apt-get install --yes tor'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/tor/torrc', __dir__),
        '/etc/tor/torrc'

system! 'install', '-o', 'debian-tor', '-g', 'debian-tor', '-m', '700',
        '-d', '/var/lib/tor/hidden_services'

system! 'install', '-o', 'debian-tor', '-g', 'debian-tor', '-m', '700',
        '-d', '/var/lib/tor/hidden_services/random'

system! 'install', '-o', 'debian-tor', '-g', 'debian-tor', '-m', '600',
        File.expand_path('../files/tor/hostname'),
        '/var/lib/tor/hidden_services/random/hostname'

system! 'adduser --system --group --no-create-home openvpn'
system! 'apt-get install --yes openvpn'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/vpn/server.conf'),
        '/etc/openvpn/server.conf'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/vpn/ca.crt'),
        '/etc/openvpn/ca.crt'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/vpn/server.crt'),
        '/etc/openvpn/server.crt'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/vpn/dh2048.pem'),
        '/etc/openvpn/dh2048.pem'

system! 'systemctl daemon-reload'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/resolv.conf', __dir__),
        '/etc/resolv.conf'

system! 'apt-get install --yes dnsmasq'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/dnsmasq.conf', __dir__),
        '/etc/dnsmasq.d/00-dnsmasq.conf'

system! 'install', '-o', 'root', '-g', 'root', '-m', '755',
        '-d', '/etc/ssl'

system! 'install', '-o', 'root', '-g', 'root', '-m', '755',
        '-d', '/etc/ssl/public'

system! 'install', '-o', 'root', '-g', 'root', '-m', '700',
        '-d', '/etc/ssl/private'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/ssl/braiden-vasco_network.crt-bundle'),
        '/etc/ssl/public/braiden-vasco_network.crt-bundle'

system! 'apt-get install --yes nginx'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/www/index.html', __dir__),
        '/var/www/html/index.html'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/www/pgp-public-key.asc'),
        '/var/www/html/pgp-public-key.asc'

system! 'wget', EMERCOIN_URL, '-O', '/tmp/emercoin.tar.gz'
system! 'wget', NAMECOIN_URL, '-O', '/tmp/namecoin.tar.gz'
system! 'wget', NCDNS_URL,    '-O', '/tmp/ncdns.tar.gz'

system! "echo '#{EMERCOIN_SHA256} */tmp/emercoin.tar.gz' | sha256sum -c - /tmp/emercoin.tar.gz || rm /tmp/emercoin.tar.gz"
system! "echo '#{NAMECOIN_SHA256} */tmp/namecoin.tar.gz' | sha256sum -c - /tmp/namecoin.tar.gz || rm /tmp/namecoin.tar.gz"
system! "echo '#{NCDNS_SHA256} */tmp/ncdns.tar.gz'       | sha256sum -c - /tmp/ncdns.tar.gz    || rm /tmp/ncdns.tar.gz"
