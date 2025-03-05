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

The remainder of this workflow centers around unit testing and MC/DC coverage analysis of the ***Stable*** subprogram.

## Unit Test Development

Under the ***src\ut*** subdirectory, you will find two units

> engines-test_stable.abb<br>
> standalone_test_runner.adb

### engines-test_stable.adb

This procedure body makes several calls to *Engines.Stable*, on each occasion checking the returned data matches the expected result and if it completes all calls successfully, yields 100% MC/DC coverage of the subprogram under test. The *Engines-Test_Stable* subprogram can be called by a standalone main program or from a GNATtest generated test harness, both of which will now be demonstrated.






