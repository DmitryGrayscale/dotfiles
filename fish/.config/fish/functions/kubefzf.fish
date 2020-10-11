function kubefzf
    set cline (commandline)
    if string match -q -- "kubectl get*" $cline; or string match -q -- "k get*" $cline 
        set get_type (string split ' ' $cline)[3] 
        set cmd  (kubectl get $get_type --all-namespaces -o custom-columns=:.metadata.name,:.metadata.namespace --no-headers | fzf | awk '{printf("%s -n %s",$1, $2)}')
        commandline -a " $cmd -o yaml"
        commandline -f execute
    else if string match -q -- "kubectl logs*" $cline; or string match -q -- "k logs*" $cline 
        set pod_w_ns (kubectl get pods --all-namespaces -o custom-columns=:.metadata.name,:.metadata.namespace --no-headers | fzf --preview="kubectl get pods `echo {} | awk '{printf(\"%s -n %s\", \$1, \$2)}'` -o jsonpath=\"{.spec.containers[*].name}\" | tr ' ' '\n'")
        set pod (echo $pod_w_ns | awk '{print $1}')
        set ns (echo $pod_w_ns | awk '{print $2}')
        set img (kubectl get pods $pod -n $ns -o jsonpath="{.spec.containers[*].name}" | tr ' ' '\n' | fzf)
        commandline -a " $pod -n $ns $img"
        commandline -f execute
    end
end
