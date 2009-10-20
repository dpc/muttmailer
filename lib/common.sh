#!/bin/bash

TIMESTAMP="`date +%Y%m%d%H%M`"
MAILDIR="`readlink .current`"

if [ ! -d "$MAILDIR" ]; then
	echo "Current dir not set. Use ./current.sh first!" 1>&2
	exit 1
fi

if [ -z "$1" ]; then
	LISTFILE="$MAILDIR/list"
else
	LISTFILE="$1"
	if [ ! -f "$LISTFILE" ]; then
		LISTFILE="./lists/$1"
	fi
fi

if [ ! -f "$LISTFILE" ]; then
	echo "Can't find $LISTFILE . Pass the list as an option." 1>&2
fi

BODYFILE="$MAILDIR/body"

if [ ! -f "$BODYFILE" ]; then
	echo "Can't find $BODYFILE" 1>&2
	exit 1
fi

SUBJFILE="$MAILDIR/subject"

if [ ! -f "$SUBJFILE" ]; then
	echo "Can't find $SUBJFILE" 1>&2
	exit 1
fi

SUBJECT="`cat $SUBJFILE | head -n 1`"

if [ -z "$SUBJECT" ]; then
	echo "Empty subject!" 1>&2
	exit 1
fi

LOGDIR="$MAILDIR/log"
mkdir -p "$LOGDIR"
SENTLOG="$LOGDIR/$TIMESTAMP.sent"
FAILLOG="$LOGDIR/$TIMESTAMP.fail"
FAILLOGDESC="$LOGDIR/$TIMESTAMP.fail.desc"
ATTACHDIR="$MAILDIR/attach"
