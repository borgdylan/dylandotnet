//
// System.Data.SqlNullValueException.cs
//
// Author: Duncan Mak  (duncan@ximian.com)
//
// (C) Ximian, Inc.

//
// Copyright (C) 2004 Novell, Inc (http://www.novell.com)
//
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
// 
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

using System;
using System.Globalization;
using System.Runtime.Serialization;

namespace System.Data.SqlTypes
{
#if NET_1_1
	[Serializable]
#endif
	public sealed class SqlNullValueException : SqlTypeException, ISerializable
	{
		public SqlNullValueException ()
			: base (Locale.GetText ("Data is Null. This method or property cannot be called on Null values."))
		{
		}

		public SqlNullValueException (string message)
			: base (message)
		{
		}

		public SqlNullValueException (string message, Exception e)
			: base (message, e)
		{
		}

		private SqlNullValueException (SerializationInfo si, StreamingContext sc) 
			: base (si.GetString("SqlNullValueExceptionMessage"))
		{
		}

		void ISerializable.GetObjectData (SerializationInfo si, StreamingContext context)
		{
			si.AddValue ("SqlNullValueExceptionMessage", Message, typeof(string));
		}
	}
}
