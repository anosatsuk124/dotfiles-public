# Config for exa aliases

if type exa > /dev/null 2>&1
    alias tree "ls -T"
    alias ll 'exa -al --icons'
    alias ls 'exa --icons'
    alias la 'exa -lag'
end

