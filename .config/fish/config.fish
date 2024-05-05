# Aliases
abbr --add nv nvim
abbr --add ls lsd
abbr --add l lsd -lA
abbr --add ll lsd -la
abbr --add obs cd /mnt/data/4-obsidian/main/
abbr --add tel cd /mnt/data/1-Téléchargement/

# fzf key bindings
fzf_configure_bindings --directory=\ef --history=\er --processes=\ep --variables=\ev --git_log=\el --git_status=\es

if status is-interactive
    # Commands to run in interactive sessions can go here
end
