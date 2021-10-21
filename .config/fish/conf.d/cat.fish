# Config for batcat aliases

if type batcat > /dev/null 2>&1
    alias cat 'batcat --paging=never'
    alias less 'batcat --paging=always'
end
