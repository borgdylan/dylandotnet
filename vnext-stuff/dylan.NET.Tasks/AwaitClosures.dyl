//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2014 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class private AwaitClosure<of T, U>
	
	field private Func<of T, U> _f
	field private Action _fin
	field private Func<of Exception, U> _cat
	field assembly IAwaiter<of T> _t
	field assembly TaskCompletionSource<of U> _tcs
	field assembly CancellationToken _token
	
	method assembly void AwaitClosure(var f as Func<of T, U>)
		mybase::ctor()
		_f = f
		_token = CancellationToken::get_None()
	end method
	
	method assembly void AwaitClosure(var f as Func<of T, U>, var fin as Action)
		mybase::ctor()
		_f = f
		_fin = fin
		_token = CancellationToken::get_None()
	end method
	
	method assembly void AwaitClosure(var f as Func<of T, U>, var cat as Func<of Exception, U>)
		mybase::ctor()
		_f = f
		_cat = cat
		_token = CancellationToken::get_None()
	end method
	
	method assembly void AwaitClosure(var f as Func<of T, U>, var cat as Func<of Exception, U>, var fin as Action)
		mybase::ctor()
		_f = f
		_fin = fin
		_cat = cat
		_token = CancellationToken::get_None()
	end method
	
	#if PORTABLESHIM then
		method assembly U DoLogic(var t as Task<of T>)
			if t::get_IsCanceled() then
				if _cat is null then
					if _fin isnot null then
						_fin::Invoke()
					end if

					throw new OperationCanceledException()
				else
					var r as U
					try
						r = _cat::Invoke(new OperationCanceledException())
					finally
						if _fin isnot null then
							_fin::Invoke()
						end if
					end try

					return r
				end if
			elseif t::get_IsFaulted() then
				if _cat is null then
					if _fin isnot null then
						_fin::Invoke()
					end if

					throw t::get_Exception()
				else
					var r as U
					try
						r = _cat::Invoke(t::get_Exception())
					finally
						if _fin isnot null then
							_fin::Invoke()
						end if
					end try

					return r
				end if
			end if
			
			var res as U
			try
				_token::ThrowIfCancellationRequested()
				res = _f::Invoke(t::get_Result())
			catch
				if _cat is null then
					throw ex
				else
					res = _cat::Invoke(ex)
				end if
			finally
				if _fin isnot null then
					_fin::Invoke()
				end if
			end try

			return res
		end method
	end #if
	
	method assembly void DoLogic()
		try
			var result = _t::GetResult()
			_token::ThrowIfCancellationRequested()
			
			var res as U
			try
				res = _f::Invoke(result)
			catch
				if _cat is null then
					SetHelper::TrySetException<of U>(_tcs, ex)
					return
				else
					try
						res = _cat::Invoke(ex)
					catch ex2 as Exception
						SetHelper::TrySetException<of U>(_tcs, ex2)
						return
					end try
				end if
			finally
				if _fin isnot null then
					_fin::Invoke()
				end if
			end try
			
			_tcs::TrySetResult(res)
		catch
			if _cat is null then
				if _fin isnot null then
					_fin::Invoke()
				end if
				
				SetHelper::TrySetException<of U>(_tcs, ex)
				return
			else
				var r as U
				try
					try
						r = _cat::Invoke(ex)
					catch ex2 as Exception
						SetHelper::TrySetException<of U>(_tcs, ex2)
						return
					end try
				finally
					if _fin isnot null then
						_fin::Invoke()
					end if
				end try
			
				_tcs::TrySetResult(r)
			end if
		end try
	end method
	
end class

class private AwaitClosure<of U>
	
	field private Func<of U> _f
	field private Action _fin
	field private Func<of Exception, U> _cat
	field assembly IAwaiter _t
	field assembly TaskCompletionSource<of U> _tcs
	field assembly CancellationToken _token
	
	method assembly void AwaitClosure(var f as Func<of U>)
		mybase::ctor()
		_f = f
		_token = CancellationToken::get_None()
	end method
	
	method assembly void AwaitClosure(var f as Func<of U>, var fin as Action)
		mybase::ctor()
		_f = f
		_fin = fin
		_token = CancellationToken::get_None()
	end method
	
	method assembly void AwaitClosure(var f as Func<of U>, var cat as Func<of Exception, U>)
		mybase::ctor()
		_f = f
		_cat = cat
		_token = CancellationToken::get_None()
	end method
	
	method assembly void AwaitClosure(var f as Func<of U>, var cat as Func<of Exception, U>, var fin as Action)
		mybase::ctor()
		_f = f
		_fin = fin
		_cat = cat
		_token = CancellationToken::get_None()
	end method
	
	#if PORTABLESHIM then
		method assembly U DoLogic(var t as Task)
			if t::get_IsCanceled() then
				if _cat is null then
					if _fin isnot null then
						_fin::Invoke()
					end if

					throw new OperationCanceledException()
				else
					var r as U
					try
						r = _cat::Invoke(new OperationCanceledException())
					finally
						if _fin isnot null then
							_fin::Invoke()
						end if
					end try

					return r
				end if
			elseif t::get_IsFaulted() then
				if _cat is null then
					if _fin isnot null then
						_fin::Invoke()
					end if

					throw t::get_Exception()
				else
					var r as U
					try
						r = _cat::Invoke(t::get_Exception())
					finally
						if _fin isnot null then
							_fin::Invoke()
						end if
					end try

					return r
				end if
			end if

			var res as U
			try
				_token::ThrowIfCancellationRequested()
				res = _f::Invoke()
			catch
				if _cat is null then
					throw ex
				else
					res = _cat::Invoke(ex)
				end if
			finally
				if _fin isnot null then
					_fin::Invoke()
				end if
			end try

			return res
		end method
	end #if

	method assembly void DoLogic()
		try
			_t::GetResult()
			_token::ThrowIfCancellationRequested()
			
			var res as U
			try
				res = _f::Invoke()
			catch
				if _cat is null then
					SetHelper::TrySetException<of U>(_tcs, ex)
					return
				else
					try
						res = _cat::Invoke(ex)
					catch ex2 as Exception
						SetHelper::TrySetException<of U>(_tcs, ex2)
						return
					end try
				end if
			finally
				if _fin isnot null then
					_fin::Invoke()
				end if
			end try
			
			_tcs::TrySetResult(res)
		catch
			if _cat is null then
				if _fin isnot null then
					_fin::Invoke()
				end if
				
				SetHelper::TrySetException<of U>(_tcs, ex)
				return
			else
				var r as U
				try
					try
						r = _cat::Invoke(ex)
					catch ex2 as Exception
						SetHelper::TrySetException<of U>(_tcs, ex2)
						return
					end try
				finally
					if _fin isnot null then
						_fin::Invoke()
					end if
				end try
			
				_tcs::TrySetResult(r)
			end if
		end try
	end method
	
end class

class private AwaitClosure2<of T>
	
	field private Action<of T> _f
	field private Action _fin
	field private Action<of Exception> _cat
	field assembly IAwaiter<of T> _t
	field assembly TaskCompletionSource<of AsyncVoid> _tcs
	field assembly CancellationToken _token
	
	method assembly void AwaitClosure2(var f as Action<of T>)
		mybase::ctor()
		_f = f
		_token = CancellationToken::get_None()
	end method
	
	method assembly void AwaitClosure2(var f as Action<of T>, var fin as Action)
		mybase::ctor()
		_f = f
		_fin = fin
		_token = CancellationToken::get_None()
	end method
	
	method assembly void AwaitClosure2(var f as Action<of T>, var cat as Action<of Exception>)
		mybase::ctor()
		_f = f
		_cat = cat
		_token = CancellationToken::get_None()
	end method
	
	method assembly void AwaitClosure2(var f as Action<of T>, var cat as Action<of Exception>, var fin as Action)
		mybase::ctor()
		_f = f
		_fin = fin
		_cat = cat
		_token = CancellationToken::get_None()
	end method
	
	#if PORTABLESHIM then
		method assembly void DoLogic(var t as Task<of T>)
			if t::get_IsCanceled() then
				if _cat is null then
					if _fin isnot null then
						_fin::Invoke()
					end if

					throw new OperationCanceledException()
				else
					try
						_cat::Invoke(new OperationCanceledException())
					finally
						if _fin isnot null then
							_fin::Invoke()
						end if
					end try

					return
				end if
			elseif t::get_IsFaulted() then
				if _cat is null then
					if _fin isnot null then
						_fin::Invoke()
					end if

					throw t::get_Exception()
				else
					try
						_cat::Invoke(t::get_Exception())
					finally
						if _fin isnot null then
							_fin::Invoke()
						end if
					end try

					return
				end if
			end if

			try
				_token::ThrowIfCancellationRequested()
				_f::Invoke(t::get_Result())
			catch
				if _cat is null then
					throw ex
				else
					_cat::Invoke(ex)
				end if
			finally
				if _fin isnot null then
					_fin::Invoke()
				end if
			end try
		end method
	end #if
	
	method assembly void DoLogic()
		try
			var result = _t::GetResult()
			_token::ThrowIfCancellationRequested()
			
			try
				_f::Invoke(result)
			catch
				if _cat is null then
					SetHelper::TrySetException<of AsyncVoid>(_tcs, ex)
					return
				else
					try
						_cat::Invoke(ex)
					catch ex2 as Exception
						SetHelper::TrySetException<of AsyncVoid>(_tcs, ex2)
						return
					end try
				end if
			finally
				if _fin isnot null then
					_fin::Invoke()
				end if
			end try
			
			_tcs::TrySetResult(default AsyncVoid)
		catch
			if _cat is null then
				if _fin isnot null then
					_fin::Invoke()
				end if
				
				SetHelper::TrySetException<of AsyncVoid>(_tcs, ex)
				return
			else
				try
					try
						_cat::Invoke(ex)
					catch ex2 as Exception
						SetHelper::TrySetException<of AsyncVoid>(_tcs, ex2)
						return
					end try
				finally
					if _fin isnot null then
						_fin::Invoke()
					end if
				end try
			
				_tcs::TrySetResult(default AsyncVoid)
			end if
		end try
	end method
	
end class

class private AwaitClosure2
	
	field private Action _f
	field private Action _fin
	field private Action<of Exception> _cat
	field assembly IAwaiter _t
	field assembly TaskCompletionSource<of AsyncVoid> _tcs
	field assembly CancellationToken _token
	
	method assembly void AwaitClosure2(var f as Action)
		mybase::ctor()
		_f = f
		_token = CancellationToken::get_None()
	end method
	
	method assembly void AwaitClosure2(var f as Action, var fin as Action)
		mybase::ctor()
		_f = f
		_fin = fin
		_token = CancellationToken::get_None()
	end method
	
	method assembly void AwaitClosure2(var f as Action, var cat as Action<of Exception>)
		mybase::ctor()
		_f = f
		_cat = cat
		_token = CancellationToken::get_None()
	end method
	
	method assembly void AwaitClosure2(var f as Action, var cat as Action<of Exception>, var fin as Action)
		mybase::ctor()
		_f = f
		_fin = fin
		_cat = cat
		_token = CancellationToken::get_None()
	end method
	
	#if PORTABLESHIM then
		method assembly void DoLogic(var t as Task)
			if t::get_IsCanceled() then
				if _cat is null then
					if _fin isnot null then
						_fin::Invoke()
					end if

					throw new OperationCanceledException()
				else
					try
						_cat::Invoke(new OperationCanceledException())
					finally
						if _fin isnot null then
							_fin::Invoke()
						end if
					end try

					return
				end if
			elseif t::get_IsFaulted() then
				if _cat is null then
					if _fin isnot null then
						_fin::Invoke()
					end if

					throw t::get_Exception()
				else
					try
						_cat::Invoke(t::get_Exception())
					finally
						if _fin isnot null then
							_fin::Invoke()
						end if
					end try

					return
				end if
			end if

			try
				_token::ThrowIfCancellationRequested()
				_f::Invoke()
			catch
				if _cat is null then
					throw ex
				else
					_cat::Invoke(ex)
				end if
			finally
				if _fin isnot null then
					_fin::Invoke()
				end if
			end try
		end method
	end #if
	
	method assembly void DoLogic()
		try
			_t::GetResult()
			_token::ThrowIfCancellationRequested()
			
			try
				_f::Invoke()
			catch
				if _cat is null then
					SetHelper::TrySetException<of AsyncVoid>(_tcs, ex)
					return
				else
					try
						_cat::Invoke(ex)
					catch ex2 as Exception
						SetHelper::TrySetException<of AsyncVoid>(_tcs, ex2)
						return
					end try
				end if
			finally
				if _fin isnot null then
					_fin::Invoke()
				end if
			end try
			
			_tcs::TrySetResult(default AsyncVoid)
		catch
			if _cat is null then
				if _fin isnot null then
					_fin::Invoke()
				end if
				
				SetHelper::TrySetException<of AsyncVoid>(_tcs, ex)
				return
			else
				try
					try
						_cat::Invoke(ex)
					catch ex2 as Exception
						SetHelper::TrySetException<of AsyncVoid>(_tcs, ex2)
						return
					end try
				finally
					if _fin isnot null then
						_fin::Invoke()
					end if
				end try
				
				_tcs::TrySetResult(default AsyncVoid)
			end if
		end try
	end method
	
end class