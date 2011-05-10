#!/usr/bin/env bash
set -e

if [ -f install.marker ]
then
    echo "--> Already installed"
else
    echo "--> Unzipping"
    unzip -o $SRC_DIR/python-$TARGET.zip -d . > $LOG_DIR/python.log 2>&1 || exit 1
fi
touch install.marker
