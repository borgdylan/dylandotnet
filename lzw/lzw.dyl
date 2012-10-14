//An implementation of a Lempel-Ziv-Welch compressor/decompressor library
//compile with dylan.NET v.11.2.9.8 (git) or later

//    lzw.dll dylan.NET.LZW Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

//reference C5 from local directory
#refasm "C5.Mono.dll"
//reference mscorlib and System from
//mono library directory
#refstdasm "mscorlib.dll"
#refstdasm "System.dll"

//import namespaces
import C5
import System
import System.IO
import System.Text
import System.Collections
import System.Runtime.InteropServices

//turn on debug support
#debug on

//include assemblyinfo file
#include "assemblyinfo.dyl"

//declare lzw.dll
assembly lzw dll
ver 1.1.0.0

//define dylan.NET.LZW namespace
namespace dylan.NET.LZW
	//add source files for compressor and decompressor classes
	#include "compress.dyl"
	#include "uncompress.dyl"
end namespace
