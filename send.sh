#!/bin/bash

source ./lib/common.sh

MUTT="mutt -F muttrc"

if [ -d "$ATTACHDIR" ]; then
	if [ ! -z "`ls $ATTACHDIR/`" ]; then
		for i in $ATTACHDIR/*; do
			echo "Attaching: `basename "$i"`"
			MUTT="$MUTT -a \"$i\""
		done
	fi
else
	echo "No $ATTACHDIR directory found. No attachments."
fi

OIFS="$IFS"
IFS='
'
for i in `cat $LISTFILE`; do
	echo -n "Sending to: $i ... "
	cat "$BODYFILE" | \
		eval "$MUTT \
		-s \"$SUBJECT\" -- \"$i\" 2>>\"$FAILLOGDESC\" 1>>/dev/null" \
		&& ( echo "$i" >> "$SENTLOG" && echo "OK" ) \
		|| ( echo "$i" >> "$FAILLOG" && echo "FAIL" )
done
IFS="$OIFS"
exit 0
