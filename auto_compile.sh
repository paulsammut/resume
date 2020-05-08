#!/bin/bash

# go to the right dir
cd ~/resume/base
# grab all the source files
tree -if ../ | grep "\.tex\|\.cls" | entr xelatex resume
