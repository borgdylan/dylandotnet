import System.Runtime.CompilerServices

//use only in tests, desitgned to fail when teh await mechanism calls functions out of order
class public FSMTaskAwaiterWrapper implements IAwaiter

	field private TaskAwaiter _awaiter
    field private integer _state

	method public void FSMTaskAwaiterWrapper(var awaiter as TaskAwaiter)
		mybase::ctor()
		_awaiter = awaiter
        _state = 1
	end method

	property public final virtual boolean IsCompleted
		get
            Assert::Equal<of integer>(_state, 1)
            var isc = _awaiter::get_IsCompleted()
            if isc then
                _state = 3
            else
                _state = 2
            end if

			return isc
		end get
	end property

	method public final virtual void GetResult()
		Assert::Equal<of integer>(_state, 3)
        _awaiter::GetResult()
	end method

	method public final virtual void OnCompleted(var continuation as Action)
		Assert::Equal<of integer>(_state, 2)
        _state = 3
        _awaiter::OnCompleted(continuation)
	end method

end class