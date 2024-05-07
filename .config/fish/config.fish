# Aliases
alias nv nvim

alias ls "eza --icons --color --group-directories-first"
alias l "eza --icons --color --group-directories-first --long --no-time --no-user"
alias ll "eza --icons --color --group-directories-first --all --long --no-time --no-user"
alias lt "eza --icons --color --group-directories-first --tree --level 3"

alias cat "bat -pp"

# Abbreviations
abbr --add cd z

abbr --add obs z $OBSIDIAN_PATH


# fzf key bindings
fzf_configure_bindings --directory=\ef --history=\er --processes=\ep --variables=\ev --git_log=\el --git_status=\e\cs

function fish_greeting
    treefetch
end


if status is-interactive
    # Commands to run in interactive sessions can go here
end


# zoxide initialization
zoxide init fish | source
