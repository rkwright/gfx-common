#!/bin/sh
#---------------------------------------------------
# This forks the libs and utils used by 
# geofx to the specified folder, where it creates 
# the folder 'threejs' and associated subfiles
# @rkwright, July 2017
#---------------------------------------------------

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

#--- now clean up the old files if any
function cleanOldFiles {
    printg "Clearing out old folders and files in target folder $TARGET"
    rm -R $THREEJS_DEST
    # rm -R $THREEJS_DEST/postprocess
    # rm -R $THREEJS_DEST/shaders
    # rm -R $THREEJS_DEST/loaders
    # rm -R $THREEJS_DEST/libs

    printg "Recreating the destination folders in $TARGET"
    mkdir $THREEJS_DEST
    mkdir $THREEJS_DEST/postprocess
    mkdir $THREEJS_DEST/shaders
    mkdir $THREEJS_DEST/loaders
    mkdir $THREEJS_DEST/libs
}

#---------------------------------------------------

THREEJS_SRC='/Users/rkwright/Documents/github/three.js'
THREEJS_STATS='/Users/rkwright/Documents/github/stats.js'

# make sure the supplied a targeet folder
if [ $# -eq 0 ]
  then
    printr "No target folder supplied!  Exiting..."
    printr "Usage: copy_threejs.sh <folder>"
    exit 1
fi

# save the argument - the target folder name
TARGET=$1
THREEJS_DEST="$TARGET/three-js"
THREEJS_DEST_POST="$THREEJS_DEST/postprocess"
THREEJS_DEST_SHADERS="$THREEJS_DEST/shaders"
THREEJS_DEST_LOADERS="$THREEJS_DEST/loaders"
THREEJS_DEST_LIBS="$THREEJS_DEST/libs"

STEMKOSKI_SRC="/Users/rkwright/Documents/github/stemkoski.github.com/Three.js" 

#--- now clean up the old files if any


if [ ! -d "$TARGET" ]; then
    printr "Target folder $TARGET doesn't exist!  Exiting..."
    exit 1
fi

# start by deleting the old files and re-creating the folders
cleanOldFiles;

exit 0;

printg "Copying files from $THREEJS_SRC to $THREEJS_DEST"

cp "$THREEJS_SRC/build/three.js" $THREEJS_DEST
cp "$THREEJS_SRC/build/three.min.js" $THREEJS_DEST
cp "$THREEJS_STATS/build/stats.js" $THREEJS_DEST
cp "$THREEJS_STATS/build/stats.min.js" $THREEJS_DEST
cp "$THREEJS_SRC/examples/js/Detector.js" $THREEJS_DEST


printg "Copying post-processing files from $THREEJS_SRC to $THREEJS_DEST_POST"

if [ ! -d "$THREEJS_DEST_POST" ]; then
    mkdir "$THREEJS_DEST_POST"
fi

cp "$THREEJS_SRC/examples/js/postprocessing/ClearPass.js" $THREEJS_DEST_POST
cp "$THREEJS_SRC/examples/js/postprocessing/EffectComposer.js" $THREEJS_DEST_POST
cp "$THREEJS_SRC/examples/js/postprocessing/MaskPass.js" $THREEJS_DEST_POST
cp "$THREEJS_SRC/examples/js/postprocessing/RenderPass.js" $THREEJS_DEST_POST
cp "$THREEJS_SRC/examples/js/postprocessing/ShaderPass.js" $THREEJS_DEST_POST
cp "$THREEJS_SRC/examples/js/postprocessing/TexturePass.js" $THREEJS_DEST_POST

printg "Copying shader files from $THREEJS_SRC to $THREEJS_DEST_SHADERS"

if [ ! -d "$THREEJS_DEST_SHADERS" ]; then
    mkdir "$THREEJS_DEST_SHADERS"
fi

cp "$THREEJS_SRC/examples/js/shaders/CopyShader.js" $THREEJS_DEST_SHADERS
cp "$THREEJS_SRC/examples/js/shaders/HorizontalBlurShader.js" $THREEJS_DEST_SHADERS
cp "$THREEJS_SRC/examples/js/shaders/VerticalBlurShader.js" $THREEJS_DEST_SHADERS
cp "$STEMKOSKI_SRC/js/shaders/AdditiveBlendShader.js" $THREEJS_DEST_SHADERS

printg "Copying loader files from $THREEJS_SRC to $THREEJS_DEST_LOADERS"

if [ ! -d "$THREEJS_DEST_LOADERS" ]; then
    mkdir "$THREEJS_DEST_LOADERS"
fi

cp "$THREEJS_SRC/examples/js/loaders/AWDLoader.js" $THREEJS_DEST_LOADERS
cp "$THREEJS_SRC/examples/js/loaders/BabylonLoader.js" $THREEJS_DEST_LOADERS
cp "$THREEJS_SRC/examples/js/loaders/ColladaLoader.js" $THREEJS_DEST_LOADERS
cp "$THREEJS_SRC/examples/js/loaders/DDSLoader.js" $THREEJS_DEST_LOADERS
cp "$THREEJS_SRC/examples/js/loaders/OBJLoader.js" $THREEJS_DEST_LOADERS
cp "$THREEJS_SRC/examples/js/loaders/PDBLoader.js" $THREEJS_DEST_LOADERS
cp "$THREEJS_SRC/examples/js/loaders/PLYLoader.js" $THREEJS_DEST_LOADERS
cp "$THREEJS_SRC/examples/js/loaders/AWDLoader.js" $THREEJS_DEST_LOADERS
cp "$THREEJS_SRC/examples/js/loaders/PVRLoader.js" $THREEJS_DEST_LOADERS
cp "$THREEJS_SRC/examples/js/loaders/STLLoader.js" $THREEJS_DEST_LOADERS
cp "$THREEJS_SRC/examples/js/loaders/VRMLLoader.js" $THREEJS_DEST_LOADERS
cp "$THREEJS_SRC/examples/js/loaders/VTKLoader.js" $THREEJS_DEST_LOADERS

printg "Copying libs files from $THREEJS_SRC to $THREEJS_DEST_LIBS"

if [ ! -d "$THREEJS_DEST_LIBS" ]; then
    mkdir "$THREEJS_DEST_LIBS"
fi

cp "$THREEJS_SRC/examples/js/Mirror.js" $THREEJS_DEST_LIBS
cp "$THREEJS_SRC/examples/js/curves/NURBSCurve.js" $THREEJS_DEST_LIBS
cp "$THREEJS_SRC/examples/js/curves/NURBSSurface.js" $THREEJS_DEST_LIBS
cp "$THREEJS_SRC/examples/js/curves/NURBSUtils.js" $THREEJS_DEST_LIBS
cp "$THREEJS_SRC/examples/js/geometries/TeapotBufferGeometry.js" $THREEJS_DEST_LIBS

printg "Copying complete"
ls -lR $THREEJS_DEST