#!/bin/bash

./test.sh || exit 1
echo "./send.sh" | at $*

exit 0
