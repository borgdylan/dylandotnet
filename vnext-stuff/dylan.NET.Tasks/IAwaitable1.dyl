//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2021 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

#if !NETSTANDARD1_0 then
	interface public IAwaiter<of TResult> implements INotifyCompletion

		property public autogen initonly boolean IsCompleted

		method public TResult GetResult()

		//from INotifyCompletion
		//method public void OnCompleted(var continuation as Action)

	end interface
#else
	interface public IAwaiter<of TResult>

		property public autogen initonly boolean IsCompleted

		method public TResult GetResult()
		method public void OnCompleted(var continuation as Action)

	end interface
end #if

interface public IAwaitable<of TResult>

	method public IAwaiter<of TResult> GetAwaiter()

end interface
