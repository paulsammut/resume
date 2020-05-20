#!/bin/bash

MAC_XELATEX="/usr/local/texlive/2020basic/bin/x86_64-darwin/xelatex"

# kill any pdf open
pkill acro

# go to the right dir
cd ~/resume/base

# grab all the source files
tree -if ../ | grep "\.tex\|\.cls" | entr xelatex resume

if [ "$(uname)" == "Darwin" ]; then
    # Mac OS X platform
    LATEX="/usr/local/texlive/2020basic/bin/x86_64-darwin/xelatex"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Linux
    LATEX="xelatex"
else
    LATEX="ERROR"
fi


tree -if ../ | grep "\.tex\|\.cls" | entr $LATEX resume
