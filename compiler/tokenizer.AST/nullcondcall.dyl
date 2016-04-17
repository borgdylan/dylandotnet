﻿// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple 
//Place, Suite 330, Boston, MA 02111-1307 USA 

class public NullCondCallTok extends ValueToken implements IUnaryOperatable, IConvable, INegatable, INotable, IIncDecable

	field public boolean MemberAccessFlg
	field public Token MemberToAccess
	field public Expr Exp
	
	property public virtual autogen string OrdOp
	property public virtual autogen boolean Conv
	property public virtual autogen TypeTok TTok
	property public virtual autogen boolean DoNeg
	property public virtual autogen boolean DoNot
	property public virtual autogen boolean DoInc
	property public virtual autogen boolean DoDec

	field public boolean IsArr
	field public Expr ArrLoc
	
	method public void NullCondCallTok(var value as string)
		mybase::ctor(value)
		_TTok = new TypeTok()
		_OrdOp = string::Empty
		MemberToAccess = new Token()
	end method
	
	method public void NullCondCallTok()
		ctor(string::Empty)
	end method

end class