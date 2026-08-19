if status is-interactive
    fastfetch
    bind \e\[C 'commandline -f forward-char'
    bind \eOc 'commandline -f forward-char'
end
