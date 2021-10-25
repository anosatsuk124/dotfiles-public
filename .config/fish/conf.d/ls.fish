# Config for exa aliases
set PATH "$HOME/.cargo/bin" $PATH

if type exa > /dev/null 2>&1
    alias tree "ls -T"
    alias ll 'exa -al --icons'
    alias ls 'exa --icons'
    alias la 'exa -lag'
end

