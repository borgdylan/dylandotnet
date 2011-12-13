class public auto ansi DelegateStmt extends Stmt

field public Attribute[] Attrs
field public Ident DelegateName
field public TypeTok RetTyp
field public Expr[] Params

method public void ctor0()
me::ctor()
me::Tokens = newarr Token 0
me::Line = 0
Attrs = newarr Attribute 0
DelegateName = new Ident()
Params = newarr Expr 0
RetTyp = new TypeTok()
end method

method public void AddAttr(var attrtoadd as Attribute)

var len as integer = Attrs[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as Attribute[] = newarr Attribute destl

label loop
label cont

place loop

i++

if len > 0 then

destarr[i] = Attrs[i]

end if

if i = stopel then
goto cont
else
if stopel <> -1 then
goto loop
else
goto cont
end if
end if

place cont

destarr[len] = attrtoadd

Attrs = destarr

end method

method public void AddParam(var paramtoadd as Expr)

var len as integer = Params[l]
var destl as integer = len + 1
var stopel as integer = len - 1
var i as integer = -1

var destarr as Expr[] = newarr Expr destl

label loop
label cont

place loop

i = i + 1

if len > 0 then

destarr[i] = Params[i]

end if

if i = stopel then
goto cont
else
if stopel <> -1 then
goto loop
else
goto cont
end if
end if

place cont

destarr[len] = paramtoadd

Params = destarr

end method


end class