#!/bin/sh

sb_confs=SB_CONFS
sb_include=SB_INCLUDE

vi_ex=vi
[ $0 = 'sbv' ] && vi_ex=view

# get the basename of the first argument
file=$(basename $1)

# the suffix of the file
suf=$(expr $file : '[[:graph:]]*\.\([[:alnum:]]*\)')

# select the configuration
conf=''
if [ -z $suf ]; then
	[ -f $sb_confs/$file ] && conf=$sb_confs/$file
else
	[ -f $sb_confs/$suf ] && conf=$sb_confs/$suf
fi

# create a temp file for in-file configuratoins
tmp_conf=$(mktemp /tmp/sb-conf-XXXXXX)

sed -n -e '
/sb-start/,/sb-end/p
' $1 > $tmp_conf

# translate the conf to ex commands,
# which understood by vi.
conf="$(cat $sb_confs/base $conf $tmp_conf \
	| sed -n -f $sb_include/conf-macro1.sed \
	| sed -f $sb_include/conf-macro2.sed \
	| m4 $sb_include/macro-ex.m4 - $sb_include/ex.m4)"

rm $tmp_conf

debug=DEBUG
if [ $debug = 'YES' ]; then
	echo "$conf" | tr '|' '\n' > ~/.exrc
	env EXINTI="se exrc" $vi_ex $@
else
	env EXINIT="$conf|$EXINIT" $vi_ex $@
fi
