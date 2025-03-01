setup:
	powershell -File gnatdas.ps1 -action "setup"
clean: setup
	powershell -File gnatdas.ps1 -action "clean"
gen-ut: clean
	powershell -File gnatdas.ps1 -action "gen-ut"
build-ut: gen-ut
	powershell -File gnatdas.ps1 -action "build-ut"
run-ut: build-ut
	powershell -File gnatdas.ps1 -action "run-ut"
cov-ut: gen-ut
	powershell -File gnatdas.ps1 -action "cov-ut"
standalone: clean
	powershell -File gnatdas.ps1 -action "standalone"