import System
import System.Runtime.CompilerServices
import System.Linq.Expressions
import Microsoft.CSharp.RuntimeBinder

class private static DynamicHelpers

	//$T$dyn
	method public static T Convert<of T>(var dyn as object)
		var bind = Binder::Convert(CSharpBinderFlags::None, gettype T, gettype DynamicHelpers)
		var cs = CallSite<of Func<of CallSite, object, T> >::Create(bind)
		return cs::Target::Invoke(cs, dyn)
	end method

	method public static object Binary<of T>(var expType as ExpressionType, var dyn as object, var operand as T)
		var bind = Binder::BinaryOperation(CSharpBinderFlags::None, expType, gettype DynamicHelpers, new CSharpArgumentInfo[] { _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null), _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null) _
		})
		var cs = CallSite<of Func<of CallSite, object, T, object> >::Create(bind)
		return cs::Target::Invoke(cs, dyn, operand)
	end method

	method public static object Unary(var expType as ExpressionType, var dyn as object)
		var bind = Binder::UnaryOperation(CSharpBinderFlags::None, expType, gettype DynamicHelpers, new CSharpArgumentInfo[] { _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null) _
		})
		var cs = CallSite<of Func<of CallSite, object, object> >::Create(bind)
		return cs::Target::Invoke(cs, dyn)
	end method

	//dyn::{name} = value,dyn::set_{name}(value)
	method public static void Set<of T>(var dyn as object, var name as string, var value as T)
		var bind = Binder::SetMember(CSharpBinderFlags::None, name, gettype DynamicHelpers, new CSharpArgumentInfo[] { _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null), _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null) _
		})
		var cs = CallSite<of Action<of CallSite, object, T> >::Create(bind)
		cs::Target::Invoke(cs, dyn, value)
	end method

	//dyn::set_Item(idx, value)
	method public static void SetIndex<of T, U>(var dyn as object, var idx as T, var value as U)
		var bind = Binder::SetIndex(CSharpBinderFlags::None, gettype DynamicHelpers, new CSharpArgumentInfo[] { _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null), _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null), _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null) _
		})
		var cs = CallSite<of Action<of CallSite, object, T, U> >::Create(bind)
		cs::Target::Invoke(cs, dyn, idx, value)
	end method

	//dyn::{name},dyn::get_{name}()
	method public static object Get(var dyn as object, var name as string)
		var bind = Binder::GetMember(CSharpBinderFlags::None, name, gettype DynamicHelpers, new CSharpArgumentInfo[] { _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null) _
		})
		var cs = CallSite<of Func<of CallSite, object, object> >::Create(bind)
		return cs::Target::Invoke(cs, dyn)
	end method

	//dyn::get_Item(idx)
	method public static object GetIndex<of T>(var dyn as object, var idx as T)
		var bind = Binder::GetIndex(CSharpBinderFlags::None, gettype DynamicHelpers, new CSharpArgumentInfo[] { _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null), _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null) _
		})
		var cs = CallSite<of Func<of CallSite, object, T, object> >::Create(bind)
		return cs::Target::Invoke(cs, dyn, idx)
	end method

	//dyn::{name}()
	method public static void CallSub(var dyn as object, var name as string)
		var bind = Binder::InvokeMember(CSharpBinderFlags::ResultDiscarded, name, Type::EmptyTypes, gettype DynamicHelpers, new CSharpArgumentInfo[] { _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null) _
		})
		var cs = CallSite<of Action<of CallSite, object> >::Create(bind)
		cs::Target::Invoke(cs, dyn)
	end method

	//dyn::{name}(p1)
	method public static void CallSub<of T1>(var dyn as object, var name as string, var p1 as T1)
		var bind = Binder::InvokeMember(CSharpBinderFlags::ResultDiscarded, name, Type::EmptyTypes, gettype DynamicHelpers, new CSharpArgumentInfo[] { _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null), _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null) _
		})
		var cs = CallSite<of Action<of CallSite, object, T1> >::Create(bind)
		cs::Target::Invoke(cs, dyn, p1)
	end method

	//dyn::{name}(p1, p2)
	method public static void CallSub<of T1, T2>(var dyn as object, var name as string, var p1 as T1, var p2 as T2)
		var bind = Binder::InvokeMember(CSharpBinderFlags::ResultDiscarded, name, Type::EmptyTypes, gettype DynamicHelpers, new CSharpArgumentInfo[] { _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null), _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null), _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null) _
		})
		var cs = CallSite<of Action<of CallSite, object, T1, T2> >::Create(bind)
		cs::Target::Invoke(cs, dyn, p1, p2)
	end method

	//dyn::{name}()
	method public static object CallFunc(var dyn as object, var name as string)
		var bind = Binder::InvokeMember(CSharpBinderFlags::None, name, Type::EmptyTypes, gettype DynamicHelpers, new CSharpArgumentInfo[] { _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null) _
		})
		var cs = CallSite<of Func<of CallSite, object, object> >::Create(bind)
		return cs::Target::Invoke(cs, dyn)
	end method

	//dyn::{name}(p1)
	method public static object CallFunc<of T1>(var dyn as object, var name as string, var p1 as T1)
		var bind = Binder::InvokeMember(CSharpBinderFlags::None, name, Type::EmptyTypes, gettype DynamicHelpers, new CSharpArgumentInfo[] { _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null), _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null) _
		})
		var cs = CallSite<of Func<of CallSite, object, T1, object> >::Create(bind)
		return cs::Target::Invoke(cs, dyn, p1)
	end method

	//dyn::{name}(p1, p2)
	method public static object CallFunc<of T1, T2>(var dyn as object, var name as string, var p1 as T1, var p2 as T2)
		var bind = Binder::InvokeMember(CSharpBinderFlags::None, name, Type::EmptyTypes, gettype DynamicHelpers, new CSharpArgumentInfo[] { _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null), _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null), _
			CSharpArgumentInfo::Create(CSharpArgumentInfoFlags::None, $string$null) _
		})
		var cs = CallSite<of Func<of CallSite, object, T1, T2, object> >::Create(bind)
		return cs::Target::Invoke(cs, dyn, p1, p2)
	end method

	//dyn + operand
	method public static object Add<of T>(var dyn as object, var operand as T)
		return Binary<of T>(ExpressionType::Add, dyn, operand)
	end method

	//dyn * operand
	method public static object Multiply<of T>(var dyn as object, var operand as T)
		return Binary<of T>(ExpressionType::Multiply, dyn, operand)
	end method

	//dyn - operand
	method public static object Subtract<of T>(var dyn as object, var operand as T)
		return Binary<of T>(ExpressionType::Subtract, dyn, operand)
	end method

	//dyn / operand
	method public static object Divide<of T>(var dyn as object, var operand as T)
		return Binary<of T>(ExpressionType::Divide, dyn, operand)
	end method

	//dyn % operand
	method public static object Modulo<of T>(var dyn as object, var operand as T)
		return Binary<of T>(ExpressionType::Modulo, dyn, operand)
	end method

	//dyn and operand
	method public static object And<of T>(var dyn as object, var operand as T)
		return Binary<of T>(ExpressionType::And, dyn, operand)
	end method

	//dyn or operand
	method public static object Or<of T>(var dyn as object, var operand as T)
		return Binary<of T>(ExpressionType::Or, dyn, operand)
	end method

	//dyn == operand
	method public static object Equal<of T>(var dyn as object, var operand as T)
		return Binary<of T>(ExpressionType::Equal, dyn, operand)
	end method

	//dyn != operand
	method public static object NotEqual<of T>(var dyn as object, var operand as T)
		return Binary<of T>(ExpressionType::NotEqual, dyn, operand)
	end method

	//dyn > operand
	method public static object GreaterThan<of T>(var dyn as object, var operand as T)
		return Binary<of T>(ExpressionType::GreaterThan, dyn, operand)
	end method

	//dyn < operand
	method public static object LessThan<of T>(var dyn as object, var operand as T)
		return Binary<of T>(ExpressionType::LessThan, dyn, operand)
	end method

	//dyn >= operand
	method public static object GreaterThanOrEqual<of T>(var dyn as object, var operand as T)
		return Binary<of T>(ExpressionType::GreaterThanOrEqual, dyn, operand)
	end method

	//dyn <= operand
	method public static object LessThanOrEqual<of T>(var dyn as object, var operand as T)
		return Binary<of T>(ExpressionType::LessThanOrEqual, dyn, operand)
	end method

	//dyn xor operand
	method public static object Xor<of T>(var dyn as object, var operand as T)
		return Binary<of T>(ExpressionType::ExclusiveOr, dyn, operand)
	end method

	//++dyn
	method public static object Increment(var dyn as object)
		return Unary(ExpressionType::Increment, dyn)
	end method

	//--dyn
	method public static object Decrement(var dyn as object)
		return Unary(ExpressionType::Decrement, dyn)
	end method

	//!dyn
	method public static object Not(var dyn as object)
		return #ternary {dyn::GetType() == gettype boolean ? Unary(ExpressionType::Not, dyn), Unary(ExpressionType::Negate, dyn)}
	end method

	//dyn nand operand
	method public static object Nand<of T>(var dyn as object, var operand as T)
		return Not(And<of T>(dyn, operand))
	end method

	//dyn nor operand
	method public static object Nor<of T>(var dyn as object, var operand as T)
		return Not(Or<of T>(dyn, operand))
	end method

	//dyn xnor operand
	method public static object Xnor<of T>(var dyn as object, var operand as T)
		return Not(Xor<of T>(dyn, operand))
	end method

end class
