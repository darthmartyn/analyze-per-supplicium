# **GNAT Dynamic Analysis Suite** <br> ***Kickstart Workflow***

> A Microsoft Windows host and PowerShell is required

Under the ***src*** subdirectory, an Ada package called ***Engine*** can be found.

It's package specification contains a single subprogram:

> function Stable (E : Engine) return Boolean;

along with a subprogram body:

> function Stable (E : Engine) return Boolean is<br>
> begin<br>
> &nbsp;&nbsp;&nbsp;&nbsp;return E.P < Stable_Engine_Data.P and then E.T < Stable_Engine_Data.T;<br>
> end Stable;

The remainder of this workflow centers around unit testing and MC/DC coverage <br>
analysis of the ***Stable*** subprogram.


