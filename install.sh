#!/bin/bash

echo "Beginning installation"

# Git config
echo
echo "#1: Setting up global .gitconfig"
cp configs/.gitconfig ~/.gitconfig

# Homebrew
echo
echo "#2: Installing brew & its packages"

if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing packages…"
xargs brew install -q < configs/brews.txt

# Homebrew casks
echo
echo "#3: Installing brew casks"

xargs brew install --cask -q < configs/casks.txt

# oh-my-zsh/terminal config and plugins
echo
echo "#4: Setting up oh-my-zsh"

cp configs/.zshrc ~/.zshrc

# Non-native oh-my-zsh plugins
echo
echo "#5: Pulling zsh plugins that are not natively supported"

# Ensure ZSH_CUSTOM is defined correctly
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

# List of repositories to clone
repositories=(
    "https://github.com/TamCore/autoupdate-oh-my-zsh-plugins.git autoupdate"
    "https://github.com/so-fancy/diff-so-fancy.git diff-so-fancy"
)

clone_repo() {
    local repo_url="$1"
    local target_dir="$2"

    # Check if the directory already exists
    if [ -d "$target_dir" ]; then
        # echo "Directory already exists at $target_dir, skipping"
        return 1
    fi

    git clone --quiet "$repo_url" "$target_dir"

    # Check if clone was successful
    if [ $? -eq 0 ]; then
        # echo "Successfully cloned $repo_url"
        return 0
    else
        echo "Failed to clone $repo_url"
        return 1
    fi
}

for repo in "${repositories[@]}"; do
    # Split the repo string into URL and target directory name
    read -r repo_url target_dir <<< "$repo"
    
    # echo "Cloning $target_dir, please wait…"
    clone_repo "$repo_url" "$ZSH_CUSTOM/plugins/$target_dir"
    echo
done

# mas apps
echo
echo "#6: Pulling mac apps via the mas package manager"

cat configs/mas.txt | awk '{print $1}' | xargs -n1 mas install
