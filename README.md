# Bouni's dotfiles

Managed by [yadm](https://yadm.io/)


## Tricks

In order to have a README.md but don't have it installed into the home, I use git sparse-checkout:

```
yadm gitconfig core.sparseCheckout true
yadm sparse-checkout set '/*' '!README.md' '!UNLICENSE'
```

Found in the dotfiles of [rvalieris](https://github.com/rvalieris/dotfiles/blob/master/.config/yadm/bootstrap#L9-L11)
