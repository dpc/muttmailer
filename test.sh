#!/bin/bash

source ./lib/common.sh

echo "*** Email:"
echo "Subject: $SUBJECT"
echo
cat $BODYFILE | head -n 5
if [ ! -z "`cat $BODYFILE | tail -n +6`" ]; then
	echo "(...)"
fi

echo
echo "*** Attachments:"
if [ -d "$ATTACHDIR" ]; then
	if [ ! -z "`ls $ATTACHDIR/`" ]; then
		for i in $ATTACHDIR/*; do
			echo "FILE: `basename "$i"`"
		done
	else
		echo "none (none found in $ATTACHDIR)"
	fi
else
	echo "none (no dir $ATTACHDIR)"
fi

echo
echo "*** To: "
cat $LISTFILE | head -n 5
if [ ! -z "`cat $LISTFILE | tail -n +6`" ]; then
	echo -n "(...) `cat $LISTFILE | wc -l` in total "
fi
echo "from $LISTFILE"


exit 0
