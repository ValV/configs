# Automate config file installation/update

P=p
S=s

help:
	@printf "Vim configuration vimrc may be prefixed or suffixed\n"
	@printf "Synopsis:\n"
	@printf "\tmake install\n\tmake [$(P)=prefix] [$(S)=suffix] install\n"

.ONESHELL:
install:
	@CFG=~
	@FILE=.$${$(P):+$${$(P)%-}-}vimrc$${$(S):+-$${$(S)#-}}
	@cp -v vimrc $$CFG/$$FILE
