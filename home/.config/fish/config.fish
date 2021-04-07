
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/rmeyer/tools/google-cloud-sdk/path.fish.inc' ]; . '/home/rmeyer/tools/google-cloud-sdk/path.fish.inc'; end
# set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths
set -g fish_user_paths "#(brew --prefix)" $fish_user_paths

set -x EDITOR nvim

# Fish hook for direnv
# set -g fish_user_paths "/home/linuxbrew/.linuxbrew/sbin" $fish_user_paths

# source "$HOME/.config/broot/launcher/fish/br"
source "$HOME/.asdf/asdf.fish"

direnv hook fish | source

# "Starship"
starship init fish | source
