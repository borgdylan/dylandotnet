class public auto ansi beforefieldinit StreamUtils

field public static Stream Stdin
field public static Stream Stdout
field public static Stream Stderr

field public static StreamReader InS
field public static StreamWriter OutS

method public static void ctor0()
Stdin = Console::OpenStandardInput()
Stderr = Console::OpenStandardError()
Stdout = Console::OpenStandardOutput()
InS = null
OutS = null
end method

method public static void InitInS(var s as Stream)
if InS <> null then
InS::Close()
end if
InS = new StreamReader(s)
end method

method public static void InitOutS(var s as Stream)
if OutS <> null then
OutS::Close()
end if
OutS = new StreamWriter(s)
end method

method public static void InitInOutSWithStd()
InitInS(Stdin)
InitOutS(Stdout)
end method

method public static void CloseInS()
if InS <> null then
InS::Close()
end if
end method

method public static void CloseOutS()
if OutS <> null then
OutS::Close()
end if
end method

method public static string ReadLine()
if InS <> null then
return InS::ReadLine()
else
return ""
end if
end method

method public static void WriteLine(var str as string)
if OutS <> null then
OutS::WriteLine(str)
else
end if
end method

method public static void Write(var str as string)
if OutS <> null then
OutS::Write(str)
else
end if
end method


end class