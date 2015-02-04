dnl define(`ie',`ifelse($#,1,$1,`$1 ie(shift($@))')')dnl
dnl define(`ie2',`ifelse($#,1,`ie($1)',`ie($1)
dnl ie2(shift($@))')')dnl
dnl
define(`var',`ifelse($#,0,`',$1,`',`',$#,1,``var $1 as object'',$#,2,``var $1 as $2'',``var $1 as $2 = $3'')')dnl

define(`vars',`ifelse($#,0,`',$#,1,`var($1)',`var($1)
vars(shift($@))')')dnl
define(`pvars',`ifelse($#,0,`',$#,1,`var($1)',`var($1),pvars(shift($@))')')dnl
dnl
define(`_method',``method $1 $3 $2('pvars(shift(shift(shift($@))))`)'')dnl
dnl
define(`method',`_method(`public',$@)')dnl
define(`omethod',`_method(`public hidebysig virtual',$@)')dnl
define(`ospmethod',`_method(`public hidebysig virtual specialname',$@)')dnl
define(`iimethod',`_method(`public hidebysig virtual newslot',$@)')dnl
define(`iispmethod',`_method(`public hidebysig virtual newslot specialname',$@)')dnl
define(`sspmethod',`_method(`public static specialname',$@)')dnl
define(`spmethod',`_method(`public specialname',$@)')dnl
define(`smethod',`_method(`public static',$@)')dnl
define(`pmethod',`_method(`private',$@)')dnl
define(`psmethod',`_method(`private static',$@)')dnl
dnl
define(`_field',``field $1 $3 $2'')dnl
define(`field',`ifelse($#,0,`',$1,`',`',$#,1,`_field(`public',$1,`object')',`_field(`public',$1,$2)')')dnl
define(`sfield',`ifelse($#,0,`',$1,`',`',$#,1,`_field(`public static',$1,`object')',`_field(`public static',$1,$2)')')dnl
define(`pfield',`ifelse($#,0,`',$1,`',`',$#,1,`_field(`private',$1,`object')',`_field(`private',$1,$2)')')dnl
define(`psfield',`ifelse($#,0,`',$1,`',`',$#,1,`_field(`private static',$1,`object')',`_field(`private static',$1,$2)')')dnl
dnl
define(`mainmethod',`smethod(`main',`void',`args,string[]')
`end method'')dnl
dnl
define(`_property',`pfield(`_$2',``$3'')
_method(`$1 specialname',`set_$2',`void',``value,$3'')
    `_$2 = value
end method'
_method(`$1 specialname',`get_$2',`$3')
    `return _$2
end method'
`property none $3 $2
    get get_$2()
    set set_$2()
end property'')dnl
define(`_rproperty',`pfield(`_$2',``$3'')
_method(`$1 specialname',`get_$2',`$3')
    `return _$2
end method'
`property none $3 $2
    get get_$2()
end property'')dnl
define(`property',`ifelse($#,0,`',$1,`',`',$#,1,`_property(`public',`$1',`object')',`_property(`public',`$1' , `$2')')')dnl
define(`sproperty',`ifelse($#,0,`',$1,`',`',$#,1,`_property(`public static',`$1',`object')',`_property(`public static',`$1' , `$2')')')dnl
define(`rproperty',`ifelse($#,0,`',$1,`',`',$#,1,`_rproperty(`public',`$1',`object')',`_rproperty(`public',`$1' , `$2')')')dnl
define(`srproperty',`ifelse($#,0,`',$1,`',`',$#,1,`_rproperty(`public static',`$1',`object')',`_rproperty(`public static',`$1' , `$2')')')dnl
define(`oproperty',`ifelse($#,0,`',$1,`',`',$#,1,`_property(`public hidebysig virtual',`$1',`object')',`_property(`public hidebysig virtual',`$1' , `$2')')')dnl
define(`orproperty',`ifelse($#,0,`',$1,`',`',$#,1,`_rproperty(`public hidebysig virtual',`$1',`object')',`_rproperty(`public hidebysig virtual',`$1' , `$2')')')dnl
define(`iiproperty',`ifelse($#,0,`',$1,`',`',$#,1,`_property(`public hidebysig virtual newslot',`$1',`object')',`_property(`public hidebysig virtual newslot',`$1' , `$2')')')dnl
define(`iirproperty',`ifelse($#,0,`',$1,`',`',$#,1,`_rproperty(`public hidebysig virtual newslot',`$1',`object')',`_rproperty(`public hidebysig virtual newslot',`$1' , `$2')')')dnl
dnl
define(`_event',`pfield(`_$2',``$3'')
_method(`$1 specialname',`add_$2',`void',``hdlr,$3'')
    `if _$2 == null then
        _$2 = hdlr
     else
         _$2 = _$2 + hdlr
     end if
end method'
_method(`$1 specialname',`remove_$2',`void',``hdlr,$3'')
    `if _$2 != null then
         _$2 = _$2 - hdlr
     end if
end method'
`event none $3 $2
    add add_$2()
    remove remove_$2()
end event'')dnl
define(`event',`ifelse($#,0,`',$1,`',`',$#,1,`_event(`public',`$1',`System.Delegate')',`_event(`public',`$1' , `$2')')')dnl
define(`sevent',`ifelse($#,0,`',$1,`',`',$#,1,`_event(`public static',`$1',`System.Delegate')',`_event(`public static',`$1' , `$2')')')dnl
define(`oevent',`ifelse($#,0,`',$1,`',`',$#,1,`_event(`public hidebysig virtual',`$1',`System.Delegate')',`_event(`public hidebysig virtual',`$1' , `$2')')')dnl
define(`iievent',`ifelse($#,0,`',$1,`',`',$#,1,`_event(`public hidebysig virtual newslot',`$1',`System.Delegate')',`_event(`public hidebysig virtual newslot',`$1',`$2')')')dnl
