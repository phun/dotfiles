# [chezmoi](https://www.chezmoi.io/install/)
## Installation
Install `chezmoi` and apply this repository
```
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply phun
```

To be able to push changes, update local repo to use SSH:
```
cd ~/.local/share/chezmoi/
```
```
git remote set-url origin git@github.com:phun/dotfiles.git
```
