#!/bin/bash

# required
git config --local core.commentchar     ";"
git config --local merge.ff             false
git config --local core.autocrlf        input
git config --local core.symlinks        true

# optional
#git config --local fetch.prune          true
#git config --local pull.rebase          true
#git config --local push.default         simple
