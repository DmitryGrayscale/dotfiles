function git
  if pwd -P | grep -q "^\/mnt\/c\/*"
    git.exe $argv
  else
    command git $argv
  end
end
