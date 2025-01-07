# What configs is Diego using

This is a repo to host a few of the configurations I use in my macOS installations.

## Quick install

Running `sh install.sh` will, slowly but inesorably, go through all the steps mentioned below and try to set up everything in one go. Some things might fail.

## Homebrew

* `brew leaves --installed-on-request > brews.txt` generates a list of my homebrew packages — `--installed-on-request` only shows the top-level ones, omitting their dependencies. You can find them [here](configs/my_brews.txt). Then, on a new machine, I grab that and run `xargs brew install < brews.txt` to install them
* Similarly, for packages installed via `cask`s, I generate them via `brew info --cask --json=v2 $(brew list --cask) | jq -r '.casks[] | if .tap == "homebrew/cask" then .token else "\(.tap)/\(.token)" end' > casks.txt`. On a new machine I run `xargs brew install --cask < casks.txt`

## ZSH

I like ZSH + oh my zsh, mostly because I'm used to it. I install it [while I set up my terminal](https://github.com/diegopetrucci/what-terminal-is-diego-using). My `.zshrc` config file is [here](configs/.zshrc).

## Mac App Store apps

Apps from the Mac App Store can be managed from the command line / config too:

* `mas list | awk '{print $1 "  " $2}' > mas.txt` to generate a file containing their ids and name
* `cat mas.txt | awk '{print $1}' | xargs -n1 mas install` to install them