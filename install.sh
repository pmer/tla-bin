#!/bin/sh
#
# Installs the TLA+ convenience binaries. Requires that tla2tools.jar is
# downloaded already.
#
# Usage: sudo install.sh /usr/local
# or     sudo install.sh /usr
# or     ./install.sh ~/.local
#

set -e

PREFIX="$1"

if [ -z "$PREFIX" ]; then
	PREFIX=/usr/local
fi

# Try cleaning up dirty files from last run
rm -rf staging

# Stage the files in bin/*
mkdir -p staging
cp -r bin staging/bin

# Modify the staged files so they use the $PREFIX
if [ `uname -s` = Linux ]; then
    # GNU sed
    sed -i -e s_PREFIX_"$PREFIX"_ staging/bin/*
else
    # BSD sed
    sed -i '' -e s_PREFIX_"$PREFIX"_ staging/bin/*
fi

# Install everything
install -dv $PREFIX/lib
install -v tla2tools.jar $PREFIX/lib

install -dv $PREFIX/bin
install -v staging/bin/* $PREFIX/bin

# Cleanup
rm -rf staging
