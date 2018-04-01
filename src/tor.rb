#!/usr/bin/env ruby
# frozen_string_literal: true

def system!(*args)
  raise unless system(*args)
end

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
