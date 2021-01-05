dnl macros to generate ex's configuration
define(`sb_abbre', `ab $1 $2|')dnl
define(`sb_init', `$1|')dnl
define(`sb_map', `map $1 $2|')dnl
define(`sb_mapi', `map! $1 $2|')dnl
define(`sb_def', `define(`$1', `$2')')dnl
define(`sb_include', `esyscmd(`sbm $1')')dnl
dnl
changecom(`SB_COMMENT_BEGIN', `SB_COMMENT_END')dnl
