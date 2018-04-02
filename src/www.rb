#!/usr/bin/env ruby
# frozen_string_literal: true

def system!(*args)
  raise unless system(*args)
end

system! 'apt-get install --yes nginx'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/www/index.html', __dir__),
        '/var/www/html/index.html'
