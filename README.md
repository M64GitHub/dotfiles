My dotfiles

Made for gnu [stow](https://www.gnu.org/software/stow/)

To install, clone into `~`, then

```zsh
# cd ~/dotfiles
for i in [a-z]*; do
    echo $i
    stow $i
done
```

