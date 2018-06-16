#!/bin/bash

__powerline() {
  pip install --user powerline
  pip install --user powerline-shell
}

__ruby_deps() {
  sudo dnf install -y git gcc-c++ bzip2 openssl-devel libyaml-devel \
    libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel
}

# should be profile (dev) specific
__ruby() {
  __ruby_deps
  git clone git://github.com/sstephenson/rbenv.git $HOME/.rbenv
  git clone git://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
  # still requires install after profile is setup, eg.
  # rbenv install 2.5.1
  # rbenv global 2.5.1
  # rbenv local 2.5.1
}

python ./profiles/install --profile=dev
