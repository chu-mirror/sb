N
/.*\n-abbre/s/\t\([[:graph:]]*\)[[:blank:]]'*\(.*\)'[[:blank:]]*\n-\([a-z]*\):/sb_\3(\1, `\2')/
/.*\n-map/s/\t\([[:graph:]]*\)[[:blank:]]*\([[:graph:]]*\)[[:blank:]]*\n-\([a-z]*\):/sb_\3(`\1', `sb_p_\2')/
/.*\n-mapi/s/\t\([[:graph:]]*\)[[:blank:]]*\([[:graph:]]*\)[[:blank:]]*\n-\([a-z]*\):/sb_\3(`\1', `sb_p_\2')/
/.*\n-macro/s/\t\([[:graph:]]*\)[[:blank:]]*'\(.*\)'[[:blank:]]*\n-\([a-z]*\):/sb_\3(`sb_p_\1', `\2')/
/.*\n-init/s/\t\(.*\)\n-\([a-z]*\):/sb_\2(`\1')/
s/$/dnl/
