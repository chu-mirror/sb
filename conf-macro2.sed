N
/.*\n-\(abbre\)\|\(def\)/s/\t\([[:graph:]]*\)[[:blank:]]*'\(.*\)'\n-\([a-z]*\):/sb_\3(`\1', `\2')/
/.*\n-mapi\?/s/\t\([[:graph:]]*\)[[:blank:]]*\([[:graph:]]*\)\n-\([a-z]*\):/sb_\3(`\1', `\2')/
/.*\n-init/s/\t\(.*\)\n-\([a-z]*\):/sb_\2(`\1')/
/.*\n-include/s/\t\([[:graph:]]*\)[[:blank:]]*\n-\([a-z]*\):/sb_\2(`\1')/
s/$/dnl/
