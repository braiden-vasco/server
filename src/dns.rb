#!/usr/bin/env ruby
# frozen_string_literal: true

def system!(*args)
  raise unless system(*args)
end

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/resolv.conf', __dir__),
        '/etc/resolv.conf'

system! 'apt-get install --yes dnsmasq'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/dns/dnsmasq.conf', __dir__),
        '/etc/dnsmasq.conf'
