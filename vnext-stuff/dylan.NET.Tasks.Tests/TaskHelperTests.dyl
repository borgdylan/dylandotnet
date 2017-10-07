class public TaskHelperTests

	[method: Fact()]
	method public void Completed_RanToCompletion()
		var t = TaskHelpers::Completed()
		Assert::Equal<of TaskStatus>(t::get_Status(), TaskStatus::RanToCompletion)
	end method

	[method: Fact()]
	method public void FromError_Faulted()
		var t = TaskHelpers::FromError(new Exception())
		Assert::True(t::get_IsFaulted())
	end method

	[method: Fact()]
	method public void FromError_Equals()
		var e = new Exception()
		var t = TaskHelpers::FromError(e)
		Assert::True(e === t::get_Exception()::get_InnerException())
	end method

	[method: Fact()]
	method public void NullResult_RanToCompletion()
		var t = TaskHelpers::NullResult()
		Assert::Equal<of TaskStatus>(t::get_Status(), TaskStatus::RanToCompletion)
	end method

	[method: Fact()]
	method public void NullResult_NullResult()
		var t = TaskHelpers::NullResult()
		Assert::Equal<of object>(t::get_Result(), null)
	end method

end class

