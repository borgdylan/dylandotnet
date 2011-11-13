class public auto ansi Keyboard

method public static string ReadString()
return Console::ReadLine()
end method

method public static integer ReadInteger()
return $integer$ReadString()
end method

method public static sbyte ReadSbyte()
return $sbyte$ReadString()
end method

method public static short ReadShort()
return $short$ReadString()
end method

method public static long ReadLong()
return $long$ReadString()
end method

method public static single ReadSingle()
return $single$ReadString()
end method

method public static double ReadDouble()
return $double$ReadString()
end method

method public static char ReadChar()
return $char$ReadString()
end method

method public static boolean ReadBoolean()
return $boolean$ReadString()
end method

end class