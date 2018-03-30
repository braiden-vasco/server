#!/usr/bin/env ruby
# frozen_string_literal: true

def system!(*args)
  raise unless system(*args)
end

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/hostname', __dir__),
        '/etc/hostname'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/hosts', __dir__),
        '/etc/hosts'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/sysctl.conf', __dir__),
        '/etc/sysctl.d/00-sysctl.conf'

system! 'sysctl -p /etc/sysctl.d/00-sysctl.conf'
