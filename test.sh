#!/bin/bash

source ./lib/common.sh

BREAKLINE="$(tput setaf 1)***$(tput sgr0)"
echo "$BREAKLINE Email:"
echo "Subject: $SUBJECT"
echo
cat $BODYFILE | head -n 8
if [ ! -z "`cat $BODYFILE | tail -n +9`" ]; then
	echo "(...)"
fi

echo
echo "$BREAKLINE Attachments:"
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
echo "$BREAKLINE To: "
cat $LISTFILE | head -n 5
if [ ! -z "`cat $LISTFILE | tail -n +6`" ]; then
	echo -n "(...) $(tput setaf 1)`cat $LISTFILE | wc -l`$(tput sgr0) in total "
fi
echo "from $LISTFILE"


exit 0
