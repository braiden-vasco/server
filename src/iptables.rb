#!/usr/bin/env ruby
# frozen_string_literal: true

def system!(*args)
  raise unless system(*args)
end

system! 'apt-get install --yes iptables-persistent'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/iptables/rules.v4'),
        '/etc/iptables/rules.v4'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/iptables/rules.v6'),
        '/etc/iptables/rules.v6'

system! 'cat /etc/iptables/rules.v4 | iptables-restore'
system! 'cat /etc/iptables/rules.v6 | ip6tables-restore'
