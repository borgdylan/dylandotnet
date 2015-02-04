#refstdasm "mscorlib.dll"
#refasm "lzw.dll"

import System
import dylan.NET.LZW

#debug on

assembly testlzw exe
ver 1.1.0.0

class private auto ansi static Program

	method private static void main()
		var c as Compressor = new Compressor()
		c::Compress("test","test.lzw")
		var d as Decompressor = new Decompressor()
		d::Decompress("test.lzw","test.orig")
	end method

end class
