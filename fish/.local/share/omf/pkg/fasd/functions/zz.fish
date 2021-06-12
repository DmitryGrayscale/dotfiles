function zz -d "cd with interactive selection"
  cd (d -l | fzf)
end
