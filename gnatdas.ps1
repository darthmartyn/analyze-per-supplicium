param ([string[]]$action = 'setup') 

$resultsdir = Join-Path $PSScriptRoot "\verification\gnatdas\mcdc_results"
$gnattests = Join-Path $PSScriptRoot "\verification\gnatdas\gnattest_tests"
$standalone = Join-Path $PSScriptRoot "\obj\gprbuild\standalone_test_runner.exe"

if ($action -eq "setup") {
    if (Test-Path $resultsdir) {Remove-Item -Path $resultsdir -Recurse}
    if (-not (Test-Path $gnattests)) {New-Item -Path $gnattests -Force -ItemType Directory | Out-Null}
} elseif ($action -eq "clean") {
    Get-ChildItem -Include obj -Recurse | Remove-Item -Recurse
} elseif ($action -eq "gen-ut") {
    Start-Process gnattest -ArgumentList "-P gnatdas.gpr" -NoNewWindow -Wait
} elseif ($action -eq "build-ut") {
    Start-Process make -ArgumentList "--directory=./obj/gnattest test_driver-build" -NoNewWindow -Wait
} elseif ($action -eq "run-ut") {
    Start-Process .\obj\gnattest\test_runner.exe -NoNewWindow -Wait
} elseif ($action -eq "cov-ut") {
    Start-Process make -ArgumentList "--directory=./obj/gnattest coverage" -NoNewWindow -Wait
} elseif ($action -eq "standalone") {
    Start-Process gprbuild -ArgumentList "--implicit-with=aunit.gpr -p -P standalone.gpr -bargs -E" -NoNewWindow -Wait
    if (Test-Path $standalone) {
        Start-Process $($standalone) -NoNewWindow -Wait
    }
}