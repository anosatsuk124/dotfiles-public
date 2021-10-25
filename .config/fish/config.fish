set fish_key_bindings fish_user_key_bindings
export EDITOR=nvim

# >>> conda initialize >>>
if test -d ~/miniconda3
# !! Contents within this block are managed by 'conda init' !!
    eval /home/anosatsuk124/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
end

# Save fish configuration permanently
function saveconf -d 'Save fish configuration permanently.'
    echo $argv >> ~/.config/fish/conf.d/saved.fish
    . ~/.config/fish/conf.d/saved.fish
end

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

# Set the path to go installation-dir
# set PATH "$HOME/go/bin" $PATH

# Set the env for fzf
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_DEFAULT_COMMAND='ag -a --ignore .git -g ""'
