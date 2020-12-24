dnl
dnl The control characters
dnl The I, J, Q, S are not in list
dnl
define(`CTRL_A', )dnl
define(`CTRL_B', )dnl
define(`CTRL_C', )dnl
define(`CTRL_D', )dnl
define(`CTRL_E', )dnl
define(`CTRL_F', )dnl
define(`CTRL_G', )dnl
define(`CTRL_H', )dnl
define(`CTRL_K', )dnl
define(`CTRL_L', )dnl
define(`CTRL_M', )dnl
define(`CTRL_N', )dnl
define(`CTRL_O', )dnl
define(`CTRL_P', )dnl
define(`CTRL_R', )dnl
define(`CTRL_T', )dnl
define(`CTRL_U', )dnl
define(`CTRL_V', )dnl
define(`CTRL_W', )dnl
define(`CTRL_X', )dnl
define(`CTRL_Y', )dnl
define(`CTRL_Z', )dnl
dnl
define(`sb_abbre', 
	`define(`sb_conf', sb_conf`|ab $1 $2')')dnl
define(`sb_init',
	`define(`sb_conf', sb_conf`|$1')')dnl
define(`sb_map',
	`define(`sb_conf', sb_conf`|map $1 $2')')dnl
define(`sb_mapi',
	`define(`sb_conf', sb_conf`|map! $1 $2')')dnl
define(`sb_macro',
	`define(`$1', ``$2'')')dnl
dnl
changecom(`SB_COMMENT_BEGIN', `SB_COMMENT_END')dnl
define(`sb_conf', `se redraw')dnl
