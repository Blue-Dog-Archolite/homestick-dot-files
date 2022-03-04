# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/home/rmeyer/tools/google-cloud-sdk/path.fish.inc' ]; . '/home/rmeyer/tools/google-cloud-sdk/path.fish.inc'; end
# set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths
set -g fish_user_paths "#(brew --prefix)" $fish_user_paths

# set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar";
# set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew";
# set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew";
# set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH;
# set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH;
# set -q PATH; or set PATH ''; set -gx PATH "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin" $PATH;

set -x EDITOR nvim

# Fish hook for direnv

# source "$HOME/.config/broot/launcher/fish/br"
# source "$HOME/.asdf/asdf.fish"
# source "$HOME/.nix-profile/etc/profile.d/nix.sh"



direnv hook fish | source

# "Starship"
# starship init fish | source
rvm default
