direnv hook fish | source

# set -g fish_user_paths "#(brew --prefix)" $fish_user_paths

set -x EDITOR nvim
set -g EDITOR nvim

# kubectl Krew path
set -gx PATH $PATH $HOME/.krew/bin


# "Starship"
starship init fish | source
