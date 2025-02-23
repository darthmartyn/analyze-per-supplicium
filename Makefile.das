setup:
	ACTION=setup powershell -File das.ps1
clean: setup
	ACTION=clean powershell -File das.ps1
gen-ut: clean
	ACTION=gen-ut powershell -File das.ps1
build-ut: gen-ut
	ACTION=build-ut powershell -File das.ps1
run-ut: build-ut
	ACTION=run-ut powershell -File das.ps1
cov-ut: gen-ut
	ACTION=cov-ut powershell -File das.ps1
