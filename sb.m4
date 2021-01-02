#!/bin/sh

define(`cat_to_conf', `[ -f $1 ] && cat $1 >> $conf')dnl

sb_confs=$HOME/SB_CONFS
sb_include=SB_INCLUDE

vi_ex=vi
[ $0 = 'sbv' ] && vi_ex=view

# Analyse the first argument
file=$(basename $1)
dir=$(dirname $1)

# the suffix of the file
suf=$(expr $file : '[[:graph:]]*\.\([[:alnum:]]*\)')

# use a temporary file to construct configuration
conf=$(mktemp)

# search a file named base in $sb_confs first
cat_to_conf($sb_confs/o-base)

if [ -z $suf ]; then
	cat_to_conf($sb_confs/f-$file)
else
	cat_to_conf($sb_confs/s-$suf)
fi

# if you prefer .sbrc than .exrc
cat_to_conf($dir/.sbrc)

# extract configuration from file being edited
[ -f $1 ] && sed -n -f $sb_include/infile-conf.sed $1 >> $conf

# translate the conf to ex commands,
# which understood by vi.
conf_ex="$(cat $conf \
	| sed -n -f $sb_include/conf-macro1.sed \
	| sed -f $sb_include/conf-macro2.sed \
	| m4 $sb_include/macro-ex.m4 - )"

rm $conf

debug=DEBUG
if [ $debug = 'YES' ]; then
	echo "$conf_ex" | tr '|' '\n' > ~/.exrc
	env EXINTI="se exrc" $vi_ex $@
else
	env EXINIT="se redraw|$conf_ex|$EXINIT" $vi_ex $@
fi
