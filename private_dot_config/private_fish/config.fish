if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting
atuin init fish | source
alias paruf="paru -Slq | fzf --multi --preview 'paru -Sii {1}' --preview-window=down:75% | xargs -ro paru -S"
