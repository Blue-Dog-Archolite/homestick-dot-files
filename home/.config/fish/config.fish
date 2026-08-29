direnv hook fish | source

# set -g fish_user_paths "#(brew --prefix)" $fish_user_paths

set -gx EDITOR nvim

# Machine-local secrets. Untracked and intentionally absent from the repo.
if test -f $HOME/.config/fish/secrets.fish
    source $HOME/.config/fish/secrets.fish
end

# kubectl Krew path
set -gx PATH $PATH $HOME/.krew/bin

# Mason (nvim) tool path. Appended, not prepended, so a system or brew copy of
# a tool always wins over Mason's editor-managed one.
set -gx PATH $PATH $HOME/.local/share/nvim/mason/bin


# "Starship"
starship init fish | source

# Mise
eval "$(mise activate fish)"

# uv and other user-installed binaries. Appended, not prepended: mise manages
# newer uv/uvx, and fish puts $fish_user_paths (what fish_add_path writes to)
# ahead of everything, which would silently pin the older copies here.
set -gx PATH $PATH $HOME/.local/bin

# ROCm GPU Acceleration for Ollama (AMD Radeon 780M)
set -gx ROCM_HOME /usr/lib64/rocm
set -gx PATH $ROCM_HOME/bin $PATH
set -gx LD_LIBRARY_PATH $ROCM_HOME/lib $ROCM_HOME/lib64 /usr/lib64 /usr/lib $LD_LIBRARY_PATH
set -gx HSA_OVERRIDE_GFX_VERSION gfx1101
set -gx GPU_DEVICE_ORDINAL 0
set -gx OLLAMA_NUM_GPU 1


# Configure ssh-agent and keys
# content has to be in .config/fish/config.fish
# if it does not exist, create the file
setenv SSH_ENV $HOME/.ssh/environment

function start_agent
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV
    . $SSH_ENV > /dev/null
    ssh-add
end

function test_identities
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else
        start_agent
    end
end

start_agent

# NTM - Named Tmux Manager
ntm shell fish | source

# Terraform alias
alias tf=terraform

# ngrok alias. `-e NGROK_AUTHTOKEN` with no value passes the variable through
# from the environment; it is set in secrets.fish, which is not tracked. This
# file is committed to a public repo, so no credentials belong in it.
alias start_ngrok='docker run --net=host -it -e NGROK_AUTHTOKEN ngrok/ngrok:latest http 8000'

# Headroom alias
alias hwc="headroom wrap claude"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"

# Google Cloud SDK — version-independent path. The gcloud-cli cask symlinks
# ~/.linuxbrew/bin/gcloud at a *versioned* Caskroom path, so that link is
# recreated on every upgrade and briefly disappears mid-upgrade. This entry
# does not move.
fish_add_path "/home/linuxbrew/.linuxbrew/share/google-cloud-sdk/bin"
