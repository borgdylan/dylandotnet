//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2017 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

class private CatchClosure<of TException> where TException as {Exception}

	field private Action<of TException> _cat
	field private Action<of Exception> _outer

	method assembly void CatchClosure(var cat as Action<of TException>, var outer as Action<of Exception>)
		mybase::ctor()
		_cat = cat
		_outer = outer
	end method

	method assembly void Catch(var e as Exception)
		var ex2 = e as TException
		if ex2 isnot null then
			try
				_cat::Invoke(ex2)
			catch
				_outer::Invoke(ex)
			end try
		else
			_outer::Invoke(e)
		end if
	end method

end class
