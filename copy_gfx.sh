#!/bin/sh
#------------------------------------------------------------------------------
# This script is intended to update a specified folder (usually a sandbox) 
# with the contents of the current clone of gfx-three-js.
# Typical usage is to navigate to the target folder then enter
#  'gfx_copy.sh .'
#
# @rkwright, August 2017
#------------------------------------------------------------------------------

red='\033[1;31m'
green='\033[0;32m'
NC='\033[00m' # no color

function echo_pwd {
    printf "${green}"
    pwd
    printf "${NC}"
}

function printg {
    printf "${green}"
    printf %s "$1"
    printf "${NC}\n"
}

function printr {
    printf "${red}"
    printf %s "$1"
    printf "${NC}\n"
}
#---------------------------------------------------

GFX_SRC='/Users/rkwright/Documents/github/gfx-three-js'

# make sure the user supplied a targeet folder
if [ $# -eq 0 ]
  then
    printr "No target folder supplied!  Exiting..."
    printr "Usage: copy_gfx.sh <folder>"
    exit 1
fi

# save the argument - the target folder name
TARGET=$1

if [ ! -d "$TARGET" ]; then
    printr "Target folder $TARGET doesn't exist!  Exiting..."
    exit 1
fi

printg "Removing any existing files, i.e. updating"
rm -R $TARGET/css
rm -R $TARGET/fonts
rm -R $TARGET/gfx
rm -R $TARGET/images
rm -R $TARGET/three-js

printg "Copying files from $GFX_SRC to $TARGET"

cp -r  "$GFX_SRC/css" $TARGET
cp -r  "$GFX_SRC/fonts" $TARGET
cp -r  "$GFX_SRC/gfx" $TARGET
cp -r  "$GFX_SRC/images" $TARGET
cp -r  "$GFX_SRC/three-js" $TARGET

printg "Copying complete"
ls -lR $GFX_DEST