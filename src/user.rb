#!/usr/bin/env ruby
# frozen_string_literal: true

def system!(*args)
  raise unless system(*args)
end

system! 'id braiden-vasco || adduser --disabled-password --gecos '' braiden-vasco'

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
