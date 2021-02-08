#!/bin/sh

sb_confs=$HOME/SB_CONFS
sb_include=SB_INCLUDE

conf_macro() {
	sed -n -f $sb_include/conf-macro1.sed \
		| sed -f $sb_include/conf-macro2.sed
}

macro_ex() {
	m4 $sb_include/macro-ex.m4 - 
}

conf_ex() {
	conf_macro | macro_ex
}

cat_to_conf() {
	[ -f $1 ] && cat $1 >> $conf
}

case $1 in
	'-e') shift; cat $@ | macro_ex; exit 0 ;;
	'-m') shift; cat $@ | conf_macro; exit 0 ;;
	'-t') do_not_edit=YES; shift ;;
	*) 
esac

vi_ex=vi
# if reading instead of writing
[ $(basename $0) = 'sbv' ] && vi_ex=view

# Analyse the first argument
file=$(basename $1)
dir=$(dirname $1)

# the suffix of the file
suf=$(expr $file : '[[:graph:]]*\.\([[:alnum:]]*\)')

# use a temporary file to construct configuration
conf=$(mktemp)

# search a file named base in $sb_confs first
cat_to_conf $sb_confs/o-base

if [ -z $suf ]; then
	cat_to_conf $sb_confs/f-$file
else
	cat_to_conf $sb_confs/s-$suf
fi

# if you prefer .sbrc than .exrc
cat_to_conf $dir/.sbrc

# extract configuration from file being edited
[ -f $1 ] && sed -n -f $sb_include/infile-conf.sed $1 >> $conf

# load keymap 
cat_to_conf $sb_confs/o-keymap

# translate the conf to ex commands,
# which understood by vi.
ex="$(cat $conf | conf_ex)"

# delete temporary file
rm $conf

if [ $do_not_edit = 'YES' ]; then
	echo "$ex" | tr '|' '\n'
else
	env EXINIT="se redraw|$ex|$EXINIT" $vi_ex $@
fi

# sb-begin
# -include:
# 	~/.sbs/s-sh
# sb-end

