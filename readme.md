# What configs is Diego using

This is a repo to host a few of the configurations I use in my macOS installations.

## Homebrew

I use `brew leaves > my_brews.txt` to generate a list of my homebrew packages. You can find them [here](configs/my_brews.txt). Then, on a new machine, I grab that and run `xargs brew install < my_brews.txt` to install them.

## ZSH

I like ZSH + oh my zsh, mostly because I'm used to it. I install it [while I set up my terminal](https://github.com/diegopetrucci/what-terminal-is-diego-using). My `.zshrc` config file is [here](configs/.zshrc).
