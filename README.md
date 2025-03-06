# **GNAT Dynamic Analysis Suite** <br> ***Kickstart Workflow***

## Unit Test Development

Under the ***src*** subdirectory, an Ada package called ***Engine*** can be found.

It's package specification contains a single subprogram:

> function Stable (E : Engine) return Boolean;

along with a subprogram body:

> function Stable (E : Engine) return Boolean is<br>
> begin<br>
> &nbsp;&nbsp;&nbsp;&nbsp;return E.P < Stable_Engine_Data.P and then E.T < Stable_Engine_Data.T;<br>
> end Stable;

The remainder of this workflow centers around unit testing and MC/DC coverage analysis of the ***Stable*** subprogram.

Under the ***src\ut*** subdirectory, you will find the following Ada unit:

> engines-test_stable.adb

This subprogram makes several calls to *Engines.Stable*, on each occasion checking the returned data matches the expected result and if it completes all calls successfully, yields 100% MC/DC coverage of the subprogram under test. The *Engines-Test_Stable* subprogram can be called by a standalone main program, to develop the test and then from a GNATtest generated test harness to form part of a larger test and coverage campaign, both of which will now be outlined.

### Standalone Test Development

Alongside ***engines-test_stable.adb***, there is a second Ada unit:

> standalone_test_runner.adb

A simple Ada main program designed to be a standalone test program runner which calls *Engines.Stable* and does nothing else. One can expand on this main subprogram to call as many test programs as one wishes, the point being it's flexible enough to permit the development of test subprograms, such as *Engines.Stable*.

Building the standalone test program runner is done using the following command line:

> ***gprbuild --implicit-with=aunit.gpr -g -p -P standalone.gpr -bargs -E***

An executable called ***standalone_test_runner*** will be built in the ***obj*** subdirectory. That's it ! A development and debug cycle is now possible for ***engines-test_stable.adb***.

One can expand on this position, following the pattern of developing and debugginh more standalone test programs, ready for reuse in an automated test and coverage campaign.

### Automated Test & Coverage Campaign

TBD

## Workflow Operation

> A Microsoft Windows host and PowerShell is required

TBD





