//    dnu.dll dylan.NET.Utils Copyright (C) 2012 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

//delegate public void ErrorWarnHandler(var line as integer, var file as string, var msg as string)

class public auto ansi ErrorException extends Exception

	method public void ErrorException()
		me::ctor("An Error Happened.")
	end method

end class

class public auto ansi static StreamUtils

	field public static initonly Stream Stdin
	field public static initonly Stream Stdout
	field public static initonly Stream Stderr

	field private static StreamReader InS
	field private static StreamWriter OutS

	field public static boolean UseConsole
	field public static boolean TerminateOnError

	field private static Action<of CompilerMsg> _ErrorH
	field private static Action<of CompilerMsg> _WarnH

	method private static void StreamUtils()
		Stdin = Console::OpenStandardInput()
		Stderr = Console::OpenStandardError()
		Stdout = Console::OpenStandardOutput()
		InS = null
		OutS = null
		UseConsole = true
		TerminateOnError = true
		_ErrorH = null
		_WarnH = null
	end method
	
	[method: ComVisible(false)]
	method public static void InitInS(var s as Stream)
		if InS != null then
			InS::Close()
		end if
		InS = new StreamReader(s)
	end method

	[method: ComVisible(false)]
	method public static void InitOutS(var s as Stream)
		if OutS != null then
			OutS::Close()
		end if
			OutS = new StreamWriter(s)
	end method

	[method: ComVisible(false)]
	method public static void InitInOutSWithStd()
		InitInS(Stdin)
		InitOutS(Stdout)
	end method

	[method: ComVisible(false)]
	method public static void CloseInS()
		if InS != null then
			InS::Close()
			InS = null
		end if
	end method

	[method: ComVisible(false)]
	method public static void CloseOutS()
		if OutS != null then
			OutS::Close()
			OutS = null
		end if
	end method

	[method: ComVisible(false)]
	method public static string ReadLine()
		if UseConsole then
			return Console::ReadLine()
		else
			if InS != null then
				return InS::ReadLine()
			else
				return String::Empty
			end if
		end if
	end method

	[method: ComVisible(false)]
	method public static void WriteLine(var str as string)
		if UseConsole then
			Console::WriteLine(str)
		else
			if OutS != null then
				OutS::WriteLine(str)
				OutS::Flush()
			end if
		end if
	end method

	[method: ComVisible(false)]
	method public static void Write(var str as string)
		if UseConsole then
			Console::Write(str)
		else
			if OutS != null then
				OutS::Write(str)
				OutS::Flush()
			end if
		end if
	end method

	[method: ComVisible(false)]
	method public static hidebysig specialname void add_ErrorH(var eh as Action<of CompilerMsg>)
		if _ErrorH = null then
			_ErrorH = eh
		else
			_ErrorH = _ErrorH + eh
		end if
	end method

	[method: ComVisible(false)]
	method public static hidebysig specialname void remove_ErrorH(var eh as Action<of CompilerMsg>)
		if _ErrorH != null then
			_ErrorH = _ErrorH - eh
		end if
	end method
	
	event none Action<of CompilerMsg> ErrorH
		add add_ErrorH()
		remove remove_ErrorH()
	end event
	
	[method: ComVisible(false)]
	method public static hidebysig specialname void add_WarnH(var eh as Action<of CompilerMsg>)
		if _WarnH = null then
			_WarnH = eh
		else
			_WarnH = _WarnH + eh
		end if
	end method

	[method: ComVisible(false)]
	method public static hidebysig specialname void remove_WarnH(var eh as Action<of CompilerMsg>)
		if _WarnH != null then
			_WarnH = _WarnH - eh
		end if
	end method
	
	event none Action<of CompilerMsg> WarnH
		add add_WarnH()
		remove remove_WarnH()
	end event

	[method: ComVisible(false)]
	method public static void WriteWarn(var line as integer, var file as string, var msg as string)
		WriteLine("WARNING: " + msg + " at line " + $string$line + " in file: " + file)
		if _WarnH != null then
			_WarnH::Invoke(new CompilerMsg(line,file,msg))
		end if
	end method

	[method: ComVisible(false)]
	method public static void WriteError(var line as integer, var file as string, var msg as string)
		WriteLine("ERROR: " + msg + " at line " + $string$line + " in file: " + file)
		if _ErrorH != null then
			_ErrorH::Invoke(new CompilerMsg(line,file,msg))
		end if
		if TerminateOnError then
			CloseInS()
			CloseOutS()
			Environment::Exit(1)
		else
			throw new ErrorException()
		end if
	end method
	
	#if RX and NET_4_5 then
	
		[method: ComVisible(false)]
		method public static IObservable<of CompilerMsg> Errors()
			return Observable::FromEvent<of CompilerMsg>(new Action<of Action<of CompilerMsg> >(add_ErrorH()),new Action<of Action<of CompilerMsg> >(remove_ErrorH()))
		end method
		
		[method: ComVisible(false)]
		method public static IObservable<of CompilerMsg> Warnings()
			return Observable::FromEvent<of CompilerMsg>(new Action<of Action<of CompilerMsg> >(add_WarnH()),new Action<of Action<of CompilerMsg> >(remove_WarnH()))
		end method
	
	end #if

end class
