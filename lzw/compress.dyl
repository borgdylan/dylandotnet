//    lzw.dll dylan.NET.LZW Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

//Lempel-Ziv-Welch Compressor
class public auto ansi Compressor
	
	//dictionary of strings-codes
	field private IDictionary<of string, ushort> Dict
	//bit queue - note that C5 LinkedLists implement C5.IQueue
	field private LinkedList<of boolean> BQ
	
	//constructor
	method public void Compressor()
		//call parent constructor
		mybase::ctor()
		//init bit queue
		BQ = new LinkedList<of boolean>()
		//init dictionary with chars available in utf-8
		Dict = new HashDictionary<of string, ushort>()
		var c as char = c'\0'
		do while c < c'\x0100'
			Dict::Add($string$c,$ushort$c)
			c = c + c'\x01'
		end do
	end method
	
	//helper function to see if dictionary has an entry
	//for a particular string of chars
	method private boolean KeyExists(var ky as string)
		foreach key in Dict::get_Keys()
			if ky = key then
				return true
			end if
		end for
		return false
	end method
	
	//function for writing queued bits to the file
	//in packets of 8 ie. bytes
	method private void WriteBits(var bw as BinaryWriter)
		//stop if there aren't even 8 bits in the queue
		do while BQ::get_Count() >= 8
			//get first 8 bits from queue and put them in a stack
			var ll as IStack<of boolean> = new LinkedList<of boolean>()
			var i as integer = 0
			do until i = 8
				i = i + 1
				ll::Push(BQ::Dequeue())
			end do
			//convert the 8 bit pattern to an unsigned 8 bit number
			var b as byte = 0ub
			i = -1
			do until i = 7
				i = i + 1
				if ll::Pop() then
					b = b + Convert::ToByte(1 << i)
				end if
			end do
			//write the byte to the binary file
			bw::Write(b)
		end do
	end method
	
	method public void Compress(var srcpath as string, var destpath as string)
		//buffer for working with bits
		var ba as BitArray = null
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
		//true if the last iteration increased the code size
		var cdszc as boolean = false
		//temp string variable
		var cs as string
		
		//while there are chars to read run loop
		do while br::get_BaseStream()::get_Position() != br::get_BaseStream()::get_Length()
			//read char and place it in a buffer
			var cc as char = $char$br::ReadByte()
			buf::Append(cc)
			
			//if string in buffer is not in dictionary
			//add the string in the dictionary and output
			//substring that was in dictionary
			if KeyExists(buf::ToString()) = false then
				cs = buf::ToString()
				//get substring that was in dictionary
				cs = cs::Substring(0,cs::get_Length() - 1)
				//get code for the substring from dictionary
				//and compute the bits for it
				var tempia as integer[] = new integer[1]
				tempia[0] = $integer$Dict::get_Item(cs)
				ba = new BitArray(tempia)
				
				//enqueue bits for writing
				var i as integer = cdsz
				if cdszc then
					cdszc = false
					i = i - 1
				end if
				do until i = 0
					i = i - 1
					BQ::Enqueue(ba::get_Item(i))
				end do
				
				//if dictionary can take more entries
				//add a new entry
				if cnt < ushort::MaxValue then
					//compute next code
					cnt = cnt + 1us
					//increase code size if needed
					if $integer$Math::Ceiling(Math::Log($double$cnt + 1d,2d)) != cdsz then
						cdsz = cdsz + 1
						cdszc = true
					end if
					//actually add a dictionary entry
					Dict::Add(buf::ToString(), cnt)
				end if
				
				//reset buffer and add last read char to it
				buf = new StringBuilder()
				buf::Append(cc)
				
				//try writing bits in the queue to the file
				WriteBits(bw)
			end if
		end do
		
		//if after the loop, chars remain in the buffer
		//then write them to the queue
		cs = buf::ToString()
		if cs::get_Length() > 0 then
			ba = new BitArray(new integer[] {$integer$Dict::get_Item(cs)})
			var i as integer = cdsz
			do until i = 0
				i = i - 1
				BQ::Enqueue(ba::get_Item(i))
			end do
		end if
		
		//if the nr of bits in the queue is not
		//a multiple of 8, pad the queue so it becomes so
		if BQ::get_Count() > 0 then
			var r as integer = BQ::get_Count() % 8 
			if r != 0 then
				var i as integer = 0
				do until i = (8 - r)
					i = i + 1
					BQ::Enqueue(false)
				end do
			end if
		end if
		
		//write all bits in the queue to the file
		WriteBits(bw)
		//clean up by closing reader and writer
		bw::Close()
		br::Close()
	end method
	
end class
