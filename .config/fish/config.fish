# General fish stuff
set -U fish_key_bindings fish_vi_key_bindings

# Aliases
alias nv nvim

alias ls "eza --icons --color --group-directories-first"
alias l "eza --icons --color --group-directories-first --long --no-time --no-user"
alias ll "eza --icons --color --group-directories-first --all --long --no-time --no-user"
alias lt "eza --icons --color --group-directories-first --tree --level 3"

alias cat "bat -pp"

alias man batman

# Abbreviations
abbr --add cd z
abbr --add obs z $OBSIDIAN_PATH

# Env var
set -gx EDITOR nvim

# fzf key bindings
fzf_configure_bindings --directory=\ef --history=\er --processes=\ep --variables=\ev --git_log=\el --git_status=\e\cs

function fish_greeting
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

zoxide init fish | source
starship init fish | source

# transient prompt for starship
enable_transience
