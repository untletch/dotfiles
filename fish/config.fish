if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Change fish greeting
set -U fish_greeting ""

# setting for pyenv
pyenv init - | source

alias cat bat

alias rg "rg -i"
