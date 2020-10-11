#!/usr/bin/env fish

if string match -q -- "*pod*" (commandline) 
    echo kek
else
    echo nokek
end

#bind --preset -k f1 commandline\ -a\ \(kubectl\ get\ pods\ --all-namespaces\ -o\ custom-columns=NAME:.metadata.name,NAMESPACE:.metadata.namespace\ \|\ tail\ -n\ +2\ \|\ fzf\ \|\ awk\ \'\{printf\(\"\%s\ -n\ \%s\",\ \$1,\ \$2\)\}\'\)
