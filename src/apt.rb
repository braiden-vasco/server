#!/usr/bin/env ruby
# frozen_string_literal: true

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
