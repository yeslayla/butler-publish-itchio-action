#!/bin/sh
set -e

mkdir -p ~/.config/itch
echo $BUTLER_CREDENTIALS > ~/.config/itch/butler_creds

versionArgument=""

if [ "$VERSION" != "" ]
then
    versionArgument="--userversion ${VERSION}"
elif [ "$VERSION_FILE" != "" ]
then
    versionArgument="--userversion-file ${VERSION_FILE}"
fi

echo "butler push \"$PACKAGE\" $ITCH_USER/$ITCH_GAME:$CHANNEL ${versionArgument}"
butler push "$PACKAGE" $ITCH_USER/$ITCH_GAME:$CHANNEL ${versionArgument}
