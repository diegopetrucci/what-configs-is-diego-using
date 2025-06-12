# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Themes

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Plugins

plugins=(
  auto-notify
  autoupdate
  copybuffer
  copyfile
  copypath
  diff-so-fancy
  git
  git-auto-fetch
  git-extras
  git-open
  macos
  sudo
  web-search
  you-should-use
  z
  zsh-autosuggestions
  zsh-completions
  zsh-history-substring-search
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code -w'
fi

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
# List all files in the current directory, including hidden files
alias lsa="ls -a"
# List all files in the current directory, including hidden files, one per line (compact)
alias lsao="ls -1a"
# Folder where the iCloud Drive files are located
alias icloud-drive="~/Library/Mobile\ Documents"

# Git

# Show git status in short format
alias gstt="git status -s"
# Create a new branch and switch to it
alias gcb="git checkout -b"
alias gcob="git checkout -b"
# Add all files, commit with a message
alias gac="git add . && git commit -m"
# Commit with a message
alias gcm="git commit -m"
# Amend the last commit without changing the message
alias gcane="git commit --amend --no-edit"
# Unstage all files
alias grhead="git reset HEAD"
# Pull with rebase
alias gpr="git pull --rebase"
# Pull main with rebase
alias gprom="git pull --rebase origin main"
# Git log, one line per commit
alias glol="git log --oneline"
# Fetch remote branches, pruning local ones, and list them
alias gfr="git fetch --all --prune && git branch -r"
# Run Claude Code in full automatic mode
alias claude-yolo="claude --dangerously-skip-permissions"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
