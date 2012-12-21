define(`ie',`ifelse($#,1,$1,`$1 ie(shift($@))')')dnl
define(`ie2',`ifelse($#,1,`ie($1)',`ie($1)
ie2(shift($@))')')dnl
dnl
define(`var',`ifelse($#,2,``var $1 as $2'',``var $1 as $2 = $3'')')dnl
define(`vars',`ifelse($#,1,`var($1)',`var($1)
vars(shift($@))')')dnl
