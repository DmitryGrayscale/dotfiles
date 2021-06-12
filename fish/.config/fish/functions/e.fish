# Defined in - @ line 1
function e --wraps='f -e emacsclient -c -a emacs' --wraps='f -e "emacsclient -c -a emacs"' --description 'alias e f -e "emacsclient -c -a emacs"'
  f -e "emacsclient -c -a emacs" $argv;
end
