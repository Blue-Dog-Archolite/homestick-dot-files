if status is-interactive

		# Setting PATH for Python 3.10
		# The original version is saved in /Users/rmeyer/.config/fish/config.fish.pysave
		set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"

		direnv hook fish | source
end



set -x PATH "/opt/homebrew/bin" "$PATH"

set -g fish_user_paths "#(brew --prefix)" $fish_user_paths

set -x EDITOR nvim
set -g EDITOR nvim

# Fish hook for direnv
# source "$HOME/.asdf/asdf.fish"
# source "$HOME/.config/broot/launcher/fish/br"
# source "$HOME/.nix-profile/etc/profile.d/nix.sh"

# "Starship"
# starship init fish | source


# SSH
# if test -z (pgrep ssh-agent)
  eval (ssh-agent -c)
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
# end

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
