﻿// //    dnu.dll dylan.NET.Utils Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
// //    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// // Foundation; either version 3 of the License, or (at your option) any later version.
// //    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
// //PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
// //    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
// //Place, Suite 330, Boston, MA 02111-1307 USA

class public InterpolateResult

	field private string _format
	field private (integer,string)[] _exprs

	method public void InterpolateResult(var format as string, var exprs as IEnumerable<of (integer, string) >)
		_format = format
		_exprs = Enumerable::ToArray<of (integer, string) >(exprs)
	end method

	property public string Format => _format
	property public (integer, string)[] Expressions => _exprs

end class
