# Dotfiles

Another attempt at managing the different dotfile profiles that I have in use spread around.

## Building

I don't know how to work with `go` yet, so this is probably wrong.

```sh
export GOPATH="$(go env GOPATH):$PATH"
mkdir -p $GOPATH/github.com/geoffjay/
ln -s $PWD/src $GOPATH/github.com/geoffjay/dotfiles-ng
# dfc deps
go get -u github.com/mitchellh/go-homedir
go get -u github.com/spf13/cobra
go get -u github.com/spf13/viper
go build github.com/geoffjay/dotfiles-ng/dfc
# dfd deps
# go get -u ...
go build github.com/geoffjay/dotfiles-ng/dfd
```

## Installation

_TODO_

## Installing a Profile

This isn't actually a thing that works yet, it's the end goal.

```sh
dot profile install --name=dev
```

## Watching for Changes in a Profile

This isn't actually a thing that works yet, it's the end goal.

```sh
dot profile watch --name=dev
```
