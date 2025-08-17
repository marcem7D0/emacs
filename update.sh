#!/bin/zsh

cp ~/.config/emacs/init.el .
git add .
git commit -m "Update config"
git push
