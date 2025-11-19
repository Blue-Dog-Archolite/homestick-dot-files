direnv hook fish | source

set -g fish_user_paths "#(brew --prefix)" $fish_user_paths

set -x EDITOR nvim
set -g EDITOR nvim

# "Starship"
starship init fish | source

# SSH
# if test -z (pgrep ssh-agent)
  # eval (ssh-agent -c)
  # set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  # set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  # set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
# # end
