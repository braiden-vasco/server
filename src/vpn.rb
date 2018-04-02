#!/usr/bin/env ruby
# frozen_string_literal: true

def system!(*args)
  raise unless system(*args)
end

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
