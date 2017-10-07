class private TaskClosure

	field private Task _t

	method public void TaskClosure(var t as Task)
		mybase::ctor()
		_t = t
	end method

	method public void AssertRTC()
		Assert::Equal<of TaskStatus>(_t::get_Status(), TaskStatus::RanToCompletion)
	end method

	method public void AssertFault(var e as Exception)
		Assert::True(_t::get_IsFaulted())
	end method

	method public void Fail()
		Assert::True(false)
	end method

	method public void Fail(var e as Exception)
		Assert::True(false)
	end method

end class

class public AwaitTests

	field private static literal integer DELAY = 2000

	method public void AwaitTests()
		mybase::ctor()
	end method

	method private void Noop()
	end method

	method private void Throw()
		throw new Exception()
	end method

	method private void FailDelay()
		Thread::Sleep(DELAY)
		throw new Exception()
	end method

	method private void Catch(var e as Exception)
	end method

	method private void Rethrow(var e as Exception)
		throw e
	end method

	[method: Fact()]
	method public Task Await_RanToCompletion_Imm ()
		//Arrange + Act
		var t = TaskHelpers::Await(TaskHelpers::Completed(), new Action(Noop))
		var tc = new TaskClosure(t)

		//Assert
		return TaskHelpers::Await(t, new Action(tc::AssertRTC), new Action<of Exception>(tc::Fail))
	end method

	[method: Fact()]
	method public Task Await_RanToCompletion_Imm2 ()
		//Arrange + Act
		var t = TaskHelpers::Await(new FSMTaskAwaiterWrapper(TaskHelpers::Completed()::GetAwaiter()), new Action(Noop))
		var tc = new TaskClosure(t)

		//Assert
		return TaskHelpers::Await(t, new Action(tc::AssertRTC), new Action<of Exception>(tc::Fail))
	end method

	[method: Fact()]
	method public Task Await_RanToCompletion_Delay ()
		//Arrange + Act
		var t = TaskHelpers::Await(Task::Delay(DELAY), new Action(Noop))
		var tc = new TaskClosure(t)

		//Assert
		return TaskHelpers::Await(t, new Action(tc::AssertRTC), new Action<of Exception>(tc::Fail))
	end method

	[method: Fact()]
	method public Task Await_RanToCompletion_Delay2 ()
		//Arrange + Act
		var t = TaskHelpers::Await(new FSMTaskAwaiterWrapper(Task::Delay(DELAY)::GetAwaiter()), new Action(Noop))
		var tc = new TaskClosure(t)

		//Assert
		return TaskHelpers::Await(t, new Action(tc::AssertRTC), new Action<of Exception>(tc::Fail))
	end method

	[method: Fact()]
	method public Task Await_Faulted_Imm ()
		//Arrange + Act
		var t = TaskHelpers::Await(TaskHelpers::FromError(new Exception()), new Action(Noop))
		var tc = new TaskClosure(t)

		//Assert
		return TaskHelpers::Await(t, new Action(tc::Fail), new Action<of Exception>(tc::AssertFault))
	end method

	[method: Fact()]
	method public Task Await_Faulted_Delay ()
		//Arrange + Act
		var t = TaskHelpers::Await(Task::Run(new Action(FailDelay)), new Action(Noop))
		var tc = new TaskClosure(t)

		//Assert
		return TaskHelpers::Await(t, new Action(tc::Fail), new Action<of Exception>(tc::AssertFault))
	end method

	[method: Fact()]
	method public Task Await_Faulted2_Imm ()
		//Arrange + Act
		var t = TaskHelpers::Await(TaskHelpers::Completed(), new Action(Throw))
		var tc = new TaskClosure(t)

		//Assert
		return TaskHelpers::Await(t, new Action(tc::Fail), new Action<of Exception>(tc::AssertFault))
	end method

	[method: Fact()]
	method public Task Await_Faulted2_Delay ()
		//Arrange + Act
		var t = TaskHelpers::Await(Task::Delay(DELAY), new Action(Throw))
		var tc = new TaskClosure(t)

		//Assert
		return TaskHelpers::Await(t, new Action(tc::Fail), new Action<of Exception>(tc::AssertFault))
	end method

	[method: Fact()]
	method public Task Await_Faulted_Imm_Catch_RTC ()
		//Arrange + Act
		var t = TaskHelpers::Await(TaskHelpers::FromError(new Exception()), new Action(Noop), new Action<of Exception>(Catch))
		var tc = new TaskClosure(t)

		//Assert
		return TaskHelpers::Await(t, new Action(tc::AssertRTC), new Action<of Exception>(tc::Fail))
	end method

	[method: Fact()]
	method public Task Await_Faulted_Delay_Catch_RTC ()
		//Arrange + Act
		var t = TaskHelpers::Await(Task::Run(new Action(FailDelay)), new Action(Noop), new Action<of Exception>(Catch))
		var tc = new TaskClosure(t)

		//Assert
		return TaskHelpers::Await(t, new Action(tc::AssertRTC), new Action<of Exception>(tc::Fail))
	end method

	[method: Fact()]
	method public Task Await_Faulted2_Imm_Catch_RTC ()
		//Arrange + Act
		var t = TaskHelpers::Await(TaskHelpers::Completed(), new Action(Throw), new Action<of Exception>(Catch))
		var tc = new TaskClosure(t)

		//Assert
		return TaskHelpers::Await(t, new Action(tc::AssertRTC), new Action<of Exception>(tc::Fail))
	end method

	[method: Fact()]
	method public Task Await_Faulted2_Delay_Catch_RTC ()
		//Arrange + Act
		var t = TaskHelpers::Await(Task::Delay(DELAY), new Action(Throw), new Action<of Exception>(Catch))
		var tc = new TaskClosure(t)

		//Assert
		return TaskHelpers::Await(t, new Action(tc::AssertRTC), new Action<of Exception>(tc::Fail))
	end method

	[method: Fact()]
	method public Task Await_Faulted_Imm_Rethrow_Faulted ()
		//Arrange + Act
		var t = TaskHelpers::Await(TaskHelpers::FromError(new Exception()), new Action(Noop), new Action<of Exception>(Rethrow))
		var tc = new TaskClosure(t)

		//Assert
		return TaskHelpers::Await(t, new Action(tc::Fail), new Action<of Exception>(tc::AssertFault))
	end method

	[method: Fact()]
	method public Task Await_Faulted_Delay_Rethrow_Faulted ()
		//Arrange + Act
		var t = TaskHelpers::Await(Task::Run(new Action(FailDelay)), new Action(Noop), new Action<of Exception>(Rethrow))
		var tc = new TaskClosure(t)

		//Assert
		return TaskHelpers::Await(t, new Action(tc::Fail), new Action<of Exception>(tc::AssertFault))
	end method

	[method: Fact()]
	method public Task Await_Faulted2_Imm_Rethrow_Faulted ()
		//Arrange + Act
		var t = TaskHelpers::Await(TaskHelpers::Completed(), new Action(Throw), new Action<of Exception>(Rethrow))
		var tc = new TaskClosure(t)

		//Assert
		return TaskHelpers::Await(t, new Action(tc::Fail), new Action<of Exception>(tc::AssertFault))
	end method

	[method: Fact()]
	method public Task Await_Faulted2_Delay_Rethrow_Faulted ()
		//Arrange + Act
		var t = TaskHelpers::Await(Task::Delay(DELAY), new Action(Throw), new Action<of Exception>(Rethrow))
		var tc = new TaskClosure(t)

		//Assert
		return TaskHelpers::Await(t, new Action(tc::Fail), new Action<of Exception>(tc::AssertFault))
	end method

end class
