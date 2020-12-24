#!/bin/sh

sb_confs=SB_CONFS

file_list=""
for arg in $@; do
	if [ -f "$sb_confs/$arg" ]; then
		file_list="$file_list $sb_confs/$arg"
	fi
done

env EXINIT="$macros" sb $file_list

