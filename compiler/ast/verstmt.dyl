//    tokenizer.AST.dll dylan.NET.Tokenizer.AST Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public auto ansi VerStmt extends Stmt

	field public IntLiteral[] VersionNos

	method public void VerStmt()
		me::ctor()
		VersionNos = new IntLiteral[] {new IntLiteral(0), new IntLiteral(0), new IntLiteral(0), new IntLiteral(0)}
	end method
	
	method public hidebysig virtual string ToString()
		var sw as StringWriter = new StringWriter()
		var i as integer = -1
		do until i = 3
			i = i + 1
			sw::Write(VersionNos[i]::ToStringNoI())
			if i < 3 then
				sw::Write(".")
			end if
		end do
		return "ver " + sw::ToString()
	end method
	
	method public Version ToVersion()
		return new Version(VersionNos[0]::NumVal, VersionNos[1]::NumVal, VersionNos[2]::NumVal, VersionNos[3]::NumVal)
	end method

end class
