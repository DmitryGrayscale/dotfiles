set -g fish_escape_delay_ms 300
bind -k f2 "kubefzf"
bind \ew 'begin; set -l buf (commandline); commandline -r "watch "$buf; end'
bind -k f3 'begin; kubectl get pods --all-namespaces; end'
