#!/bin/sh

sb_confs=$HOME/SB_CONFS

if [ $# -eq '2' ]; then
	sb $sb_confs/$1-$2
elif [ $# -eq '1' ]; then
	sb $sb_confs/$1
fi

# sb-begin
# -include:
# 	~/.sbs/s-sh
# sb-end
