#!/usr/bin/env ruby
# frozen_string_literal: true

def system!(*args)
  raise unless system(*args)
end

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
