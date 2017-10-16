" find bin from package
"

function! findbin#find(package)
    echo system('pacman -Qlq ' . a:package . ' | grep /usr/bin')
endfunction

function! findbin#complete(...)
 return system("pacman -Q | awk '{print $1}'")   
endfunction
