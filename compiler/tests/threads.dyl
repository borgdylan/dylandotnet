#refstdasm "mscorlib.dll"

import System
import System.Threading

//Threading Test
//Compile with dylan.NET 11.2.8.2 or later!!!!

#debug on

assembly threads exe
ver 1.4.0.0

namespace dylan.NET.Tests.Threading
	
	class public auto ansi Program
	
		field public static Timer TimerObj
		
		method public static void Program()
			TimerObj = null
		end method
		
		method public static void ThreadMethod()
			Console::WriteLine("Hello from Thread")
		end method
		
		method public static void ThreadMethod(var o as object)
			Console::WriteLine("Message from Thread: " + o::ToString())
		end method
		
		method public static void Loop1s()
			var i as integer = 0
			
			label cont
			label loop
			
			place loop
			
			i = i + 1
			Console::Write("1 ")
			
			if (i % 10) = 0 then
				Thread::Sleep(20)
			end if
			
			if i = 30 then
				TimerObj::Dispose()
			end if
			
			if i = 30 then
				goto cont
			else
				goto loop
			end if
			
			place cont
			
		end method
		
		method public static void Loop2s()
			var i as integer = 0
			
			label cont
			label loop
			
			place loop
			
			i = i + 1
			Console::Write("2 ")
			
			if (i % 10) = 0 then
				Thread::Sleep(20)
			end if
			
			if i = 30 then
				TimerObj::Dispose()
			end if
			
			if i = 30 then
				goto cont
			else
				goto loop
			end if
			
			place cont
			
		end method
		
		method public static void TimerMethod(var o as object)
			Console::Write("t ")
		end method
		
		method public static void main()
			var t as Thread = new Thread(new ThreadStart(ThreadMethod()))
			t::Start()
			//Thread::Sleep(1)
			t = new Thread(new ParameterizedThreadStart(ThreadMethod()))
			t::Start("hello")
			t = new Thread(new ParameterizedThreadStart(ThreadMethod()))
			t::Start($object$2d)
			Console::WriteLine("Hello")
			TimerObj = new Timer(new TimerCallback(TimerMethod()),null,0,20) 
			Thread::Sleep(100)
			t = new Thread(new ThreadStart(Loop1s()))
			t::Start()
			t = new Thread(new ThreadStart(Loop2s()))
			t::Start()
			Thread::Sleep(200)
			Console::WriteLine()
		end method
	
	end class

end namespace
