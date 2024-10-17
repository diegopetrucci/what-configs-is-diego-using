# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Themes

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Plugins

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-history-substring-search
  z
  sudo
  macos
  you-should-use
  copypath
  copyfile
  copybuffer
  web-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Custom aliases

# Free up space in Xcode by deleting derived data, archives, and simulators
alias xcodefreespace="sudo rm -rf /.DocumentRevisions-V100/
rm -rf ~/Library/Developer/Xcode/DerivedData
rm -rf ~/Library/Developer/Xcode/Archives 
rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport
rm -rf ~/Library/Developer/Xcode/ipadOS\ DeviceSupport
rm -rf ~/Library/Developer/Xcode/watchOS\ DeviceSupport
rm -rf ~/Library/Developer/Xcode/tvOS\ DeviceSupport
rm -rf ~/Library/Developer/Xcode/visionOS\ DeviceSupport
rm -rf ~/Library/Caches/com.apple.dt.Xcode
xcrun simctl delete unavailable"

# Open the current directory in Finder
alias of="open ."

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Pyenv configuration for zsh
# https://github.com/pyenv/pyenv?tab=readme-ov-file#set-up-your-shell-environment-for-pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Pyenv virtualenv configuration for zsh
eval "$(pyenv virtualenv-init -)"
# Created by `pipx` on 2024-07-03 11:13:30
export PATH="$PATH:/Users/diegopetrucci/.local/bin"

# Poetry
fpath+=~/.zfunc
autoload -Uz compinit && compinit
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/diegopetrucci/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/diegopetrucci/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/diegopetrucci/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/diegopetrucci/google-cloud-sdk/completion.zsh.inc'; fi
#source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
