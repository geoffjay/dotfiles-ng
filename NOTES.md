# Maybe Something Better

Just an idea for now, but a something that manages dotfile profiles would be great. Something with a service that
monitors files that have been installed for a user so that when the file is updated, so are the files that live with the
service.

## Service - dotfile monitor

`dotmon`

## Utility

`dot-cli`

```sh
dot list-profiles
dot set-profile <profile-ID>
dot update-profile # ?
```

## Profiles

```sh
# /etc/dot/profiles
work
  bash
    rc
    rc.d
      alias
      prompt
  config
    terminator
  vim
dev
  bash
    rc
    rc.d
      alias
      prompt
  config
    i3
  vim
```

## Dependencies

### Standard Repositories

* neofetch

### PIP Packages

* powerline
* powerline-shell

### NPM Packages
