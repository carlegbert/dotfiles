My silly little configuration files.

Setup:

```sh
target="$HOME/.dotfiles"
git clone --bare git@github.com:carlegbert/dotfiles.git "$target"
alias dots='/usr/bin/git --git-dir=$target --work-tree=$HOME'
dots checkout
dots config --local status.showUntrackedFiles no
```
