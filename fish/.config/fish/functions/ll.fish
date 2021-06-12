# Defined in - @ line 1
function ll --wraps=ls --wraps='ls -lah' --description 'alias ll ls -lah'
  ls -lah $argv;
end
