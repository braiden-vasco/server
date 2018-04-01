#!/usr/bin/env ruby
# frozen_string_literal: true

def system!(*args)
  raise unless system(*args)
end

system! 'apt-get install --yes vim'

system! 'update-alternatives --set editor /usr/bin/vim.basic'

system! 'install', '-o', 'root', '-g', 'root', '-m', '644',
        File.expand_path('../files/vim/vimrc.local'),
        '/etc/vim/vimrc.local'
