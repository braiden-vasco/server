#!/usr/bin/env ruby
# frozen_string_literal: true

def system!(*args)
  raise unless system(*args)
end

system! 'apt-get install --yes sudo'

system! 'install', '-o', 'root', '-g', 'root', '-m', '440',
        File.expand_path('../files/sudoers', __dir__),
        '/etc/sudoers'
