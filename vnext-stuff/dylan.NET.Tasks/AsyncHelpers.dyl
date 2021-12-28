//    dylan.NET.Tasks.dll dylan.NET.Tasks Copyright (C) 2021 Dylan Borg <borgdylan@hotmail.com>
//    This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later version.
//    This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
//    You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple
//Place, Suite 330, Boston, MA 02111-1307 USA

import System.Collections.Generic
import System.Threading

class private ForeachClosure<of TElement> extends TaskClosure

    field private IAsyncEnumerator<of TElement> _aen
    //must return true to keep iterating, false is interpreted as a 'break' signal
    field private Func<of TElement, boolean> _act
    field private Func<of TElement, Task<of boolean> > _act2

    method assembly void ForeachClosure(var aen as IAsyncEnumerator<of TElement>, var act as Func<of TElement, boolean>, var ctoken as CancellationToken)
        mybase::ctor()
        _aen = aen
        _act = act
        set_Canceller(ctoken)
    end method

    method assembly void ForeachClosure(var aen as IAsyncEnumerator<of TElement>, var act as Func<of TElement, Task< of boolean> >, var ctoken as CancellationToken)
        mybase::ctor()
        _aen = aen
        _act2 = act
        set_Canceller(ctoken)
    end method

    method assembly void OnMovedNext(var flg as boolean)
        if flg andalso _act::Invoke(_aen::get_Current()) then
            Await<of boolean>(_aen::MoveNextAsync(), new Action<of boolean>(OnMovedNext))
        else
            Await(_aen::DisposeAsync(), new Action(Return))
        end if
    end method

    method assembly prototype void OnMovedNext2(var flg as boolean)

    method assembly void OnInvoked(var cont as boolean)
        if cont then
            Await<of boolean>(_aen::MoveNextAsync(), new Action<of boolean>(OnMovedNext2))
        else
            Await(_aen::DisposeAsync(), new Action(Return))
        end if
    end method

    method assembly void OnMovedNext2(var flg as boolean)
        if flg then
            Await<of boolean>(_act2::Invoke(_aen::get_Current()), new Action<of boolean>(OnInvoked))
        else
            Await(_aen::DisposeAsync(), new Action(Return))
        end if
    end method

end class

class public static AsyncHelpers
    //support for await foreach

    //sync handler
    method public static Task AwaitForeach<of TElement>(var aen as IAsyncEnumerator<of TElement>, var act as Func<of TElement, boolean>, var ctoken as CancellationToken)
        var clos = new ForeachClosure<of TElement>(aen, act, ctoken)
        return clos::Await<of boolean>(aen::MoveNextAsync(), new Action<of boolean>(clos::OnMovedNext))
    end method

    method public static Task AwaitForeach<of TElement>(var alst as IAsyncEnumerable<of TElement>, var act as Func<of TElement, boolean>, var ctoken as CancellationToken)
        return AwaitForeach<of TElement>(alst::GetAsyncEnumerator(ctoken), act, ctoken)
    end method

    method public static Task AwaitForeach<of TElement>(var alst as IAsyncEnumerable<of TElement>, var act as Func<of TElement, boolean>)
        return AwaitForeach<of TElement>(alst::GetAsyncEnumerator(CancellationToken::get_None()), act, CancellationToken::get_None())
    end method

    //async handler
    method public static Task AwaitForeach<of TElement>(var aen as IAsyncEnumerator<of TElement>, var act as Func<of TElement, Task<of boolean> >, var ctoken as CancellationToken)
        var clos = new ForeachClosure<of TElement>(aen, act, ctoken)
        return clos::Await<of boolean>(aen::MoveNextAsync(), new Action<of boolean>(clos::OnMovedNext2))
    end method

    method public static Task AwaitForeach<of TElement>(var alst as IAsyncEnumerable<of TElement>, var act as Func<of TElement, Task<of boolean> >, var ctoken as CancellationToken)
        return AwaitForeach<of TElement>(alst::GetAsyncEnumerator(ctoken), act, ctoken)
    end method

    method public static Task AwaitForeach<of TElement>(var alst as IAsyncEnumerable<of TElement>, var act as Func<of TElement, Task<of boolean> >)
        return AwaitForeach<of TElement>(alst::GetAsyncEnumerator(CancellationToken::get_None()), act, CancellationToken::get_None())
    end method
end class