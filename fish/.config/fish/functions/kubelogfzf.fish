function kubefzf
    set cline (commandline)
    if string match -q -- "kubectl get*" $cline; or string match -q -- "k get*" $cline 
        set get_type (string split ' ' $cline)[3] 
        set cmd  (kubectl get $get_type --all-namespaces -o custom-columns=:.metadata.name,:.metadata.namespace --no-headers | fzf | awk '{printf("%s -n %s",$1, $2)}')
        commandline -a " $cmd -o yaml"
    end
end
