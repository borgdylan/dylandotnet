//    lzw.dll dylan.NET.LZW Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

//Lempel-Ziv-Welch Decompressor
class public auto ansi Decompressor
	
	//dictionary of codes-strings
	field private IDictionary<of ushort,string> Dict
	//bit queue - note that C5 LinkedLists implement C5.IQueue
	field private LinkedList<of boolean> BQ
	
	//constructor
	method public void Decompressor()
		//call parent constructor
		mybase::ctor()
		//init bit queue
		BQ = new LinkedList<of boolean>()
		//init dictionary with chars available in utf-8
		Dict = new HashDictionary<of ushort,string>()
		var c as char = c'\0'
		do while c < c'\x0100'
			Dict::Add($ushort$c,$string$c)
			c = c + c'\x01'			
		end do
	end method
	
	//helper function to see if dictionary has an entry
	//for a particular string of chars
	method private boolean ValExists(var v as string)
		foreach val in Dict::get_Values()
			if v = val then
				return true
			end if
		end for
		return false
	end method
	
	//function for reading a specific amount of bits
	//from the file by first reading a buffering bytes
	//into a bit queue
	method private ushort ReadBits(var br as BinaryReader, var n as integer)
		var i as integer
		do while BQ::get_Count() < n
			var ba as BitArray = new BitArray(new integer[] {$integer$br::ReadByte()})
			i = 8
			do until i = 0
				i = i - 1
				BQ::Enqueue(ba::get_Item(i))
			end do
		end do
		
		//get first n bits from queue and put them in a stack
		var ll as IStack<of boolean> = new LinkedList<of boolean>()
		i = 0
		do until i = n
			i = i + 1
			ll::Push(BQ::Dequeue())
		end do
		//convert the 8 bit pattern to an unsigned 16 bit number
		var b as ushort = 0us
		i = -1
		do until i = (n - 1)
			i = i + 1
			if ll::Pop() then
				b = b + Convert::ToUInt16(1 << i)
			end if
		end do
		
		return b
	end method
	
	method public void Decompress(var srcpath as string, var destpath as string)
		
		//reader for ingoing file
		var br as BinaryReader = new BinaryReader(new FileStream(srcpath,FileMode::Open))
		//delete already existing file
		if File::Exists(destpath) then
			File::Delete(destpath)
		end if
		//writer for outgoing file
		var bw as BinaryWriter = new BinaryWriter(new FileStream(destpath,FileMode::OpenOrCreate))
		//buffer for keeping read chars
		var buf as StringBuilder = new StringBuilder()
		//counter for determining the next code
		var cnt as ushort = 255us
		//current code size in bits
		var cdsz as integer = 8
		
		//while there are bytes to read run loop
		do while br::get_BaseStream()::get_Position() != br::get_BaseStream()::get_Length()
			//get encoded string
			var encs as ushort = ReadBits(br,cdsz)
			//decode string
			var decs as string = Dict::get_Item(encs)
			//output decoded string to file
			bw::Write(decs::ToCharArray())
			
			
			//add decoded string's chars one at time
			//while checking: if string in buffer is
			//not in dictionary add the string into the dictionary
			foreach s in decs
				
				//append char
				buf::Append(s)
				
				if ValExists(buf::ToString()) = false then
					//temporary string
					var tmps as string = buf::ToString()
					//if dictionary can take more entries
					//add a new entry
					if cnt < ushort::MaxValue then
						//compute next code
						cnt = cnt + 1us
						//increase code size if needed
						if $integer$Math::Ceiling(Math::Log($double$cnt + 1d,2d)) != cdsz then
							cdsz = cdsz + 1
						end if
						//actually add a dictionary entry
						Dict::Add(cnt,tmps)
					end if
					
					//reset buffer and add last buffer char to it
					buf = new StringBuilder()
					buf::Append(tmps::get_Chars(tmps::get_Length() - 1))
					
				end if 
			end for
		end do
		
		//clean up by closing reader and writer
		bw::Close()
		br::Close()
	end method
	
end class
