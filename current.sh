#!/bin/bash

MAILDIR="`echo $1 | sed "s,/$,,"`"

if [ -z "$MAILDIR" ]; then
	echo "Usage : ./`basename $0` <maildir>" 1>&2
	ls -al | grep '\.current'
	exit 1
fi

if [ ! -d "$MAILDIR" ]; then
	echo "$MAILDIR is not a directory!" 1>&2
	exit 1
fi

rm -f ./.current
ln -sf $MAILDIR ./.current

echo "$MAILDIR is now a default maildir."

exit 0
