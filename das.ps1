
$resultsdir = Join-Path $PSScriptRoot "\verification\gnatdas\mcdc_results"
$usertests = Join-Path $PSScriptRoot "\verification\gnatdas\user_tests"
$gnattests = Join-Path $PSScriptRoot "\verification\gnatdas\gnattest_tests"

if ($env:ACTION -eq "setup") {
    if (Test-Path $resultsdir) {Remove-Item -Path $resultsdir -Recurse}
    if (-not (Test-Path $usertests)) {New-Item -Path $usertests -Force -ItemType Directory | Out-Null}
    if (-not (Test-Path $gnattests)) {New-Item -Path $gnattests -Force -ItemType Directory | Out-Null}
} elseif ($env:ACTION -eq "clean") {
    Get-ChildItem -Include obj -Recurse | Remove-Item -Recurse
} elseif ($env:ACTION -eq "gen-ut") {
    Start-Process gnattest -ArgumentList "-P das.gpr" -NoNewWindow -Wait
} elseif ($env:ACTION -eq "build-ut") {
    Start-Process make -ArgumentList "--directory=./obj/gnattest test_driver-build" -NoNewWindow -Wait
} elseif ($env:ACTION -eq "run-ut") {
    Start-Process .\obj\gnattest\test_runner.exe -NoNewWindow -Wait
}  elseif ($env:ACTION -eq "cov-ut") {
    Start-Process make -ArgumentList "--directory=./obj/gnattest coverage" -NoNewWindow -Wait
}