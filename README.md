Made for gnu [stow](https://www.gnu.org/software/stow/):

To install, clone into `~`. 

```zsh
# cd ~/dotfiles
for i in [a-z]*; do
    echo $i
    stow $i
done
```


