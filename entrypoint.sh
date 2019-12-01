#!/bin/sh
set -e

mkdir -p ~/.config/itch
echo $BUTLER_CREDENTIALS > ~/.config/itch/butler_creds


versionArguement=""

if [ "$VERSION" != "" ]
then
    versionArguement="--userversion ${VERSION}"
elif [ "$VERSION_FILE" != "" ]
then
    versionArguement="--userversion-file ${VERSION_FILE}"
fi

butler push $PACKAGE $ITCH_USER/$ITCH_GAME:$CHANNEL ${versionArguement}