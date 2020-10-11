#!/bin/bash
echo $(comm -3 <(tmux list-sessions | awk '{print $1}' | sed 's/://g'| sort) <(sort < ~/.swplanets) | shuf | head -1)
