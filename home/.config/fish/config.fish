set -x PATH "/opt/homebrew/bin" "$PATH"

set -g fish_user_paths "#(brew --prefix)" $fish_user_paths

set -x EDITOR nvim

# Fish hook for direnv
# source "$HOME/.asdf/asdf.fish"
# source "$HOME/.config/broot/launcher/fish/br"
# source "$HOME/.nix-profile/etc/profile.d/nix.sh"

# "Starship"
# starship init fish | source

# Setting PATH for Python 3.10
# The original version is saved in /Users/rmeyer/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"

direnv hook fish | source
