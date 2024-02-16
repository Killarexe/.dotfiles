#!/bin/sh

#
# A Simple script to update this directory
#

working_dir=$PWD

cd ${BASH_SOURCE[0]}

stow .

cd working_dir
