# This is only own me.
set NVM_DIR "$HOME/.nvm"
set NVM_SYMLINK_CURRENT true
function nvm -d 'Use nvm in fish'
    if test -e "$NVM_DIR/nvm.sh"
        bass source "$NVM_DIR/nvm.sh" --no-use ';' nvm $argv  # This loads nvm
    end
end
nvm use default > /dev/null
