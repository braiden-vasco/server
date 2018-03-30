#!/usr/bin/env ruby
# frozen_string_literal: true

def system!(*args)
  raise unless system(*args)
end

$hostname = File.expand_path '../files/hostname',    __dir__
$hosts    = File.expand_path '../files/hosts',       __dir__
$sysctl   = File.expand_path '../files/sysctl.conf', __dir__

system! "install -o root -g root -m 644 #$hostname /etc/hostname"
system! "install -o root -g root -m 644 #$hosts    /etc/hosts"
system! "install -o root -g root -m 644 #$sysctl   /etc/sysctl.d/00-sysctl.conf"
system! 'sysctl -p /etc/sysctl.d/00-sysctl.conf'
