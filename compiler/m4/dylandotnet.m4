dnl define(`ie',`ifelse($#,1,$1,`$1 ie(shift($@))')')dnl
dnl define(`ie2',`ifelse($#,1,`ie($1)',`ie($1)
dnl ie2(shift($@))')')dnl
dnl
define(`var',`ifelse($#,0,`',$1,`',`',$#,1,``var $1 as object'',$#,2,``var $1 as $2'',``var $1 as $2 = $3'')')dnl
define(`vars',`ifelse($#,0,`',$#,1,`var($1)',`var($1)
vars(shift($@))')')dnl
define(`pvars',`ifelse($#,0,`',$#,1,`var($1)',`var($1),pvars(shift($@))')')dnl
dnl
define(`_method',``method $1 $3 $2('pvars(shift(shift(shift($@))))`)'
ifelse($3,`void',`',
`    return ans
')`end method'')dnl
define(`method',`_method(`public',$@)')dnl
define(`smethod',`_method(`public static',$@)')dnl
define(`pmethod',`_method(`private',$@)')dnl
define(`psmethod',`_method(`private static',$@)')dnl
define(`mainmethod',`smethod(`main',`void',`args,string[]')')dnl
