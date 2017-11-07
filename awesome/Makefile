# Help to install config file

P=p
S=s
I=XDG_CONFIG_HOME
H=HOME
A=awesome

help:
	@printf "Awesome WM configuration rc.lua may be prefixed or suffixed\n"
	@printf "Synopsis:\n"
	@printf "\tmake install\n\tmake [$(P)=prefix] [$(S)=suffix] install\n"

.ONESHELL:
install:
	@CFG=$${$(I):-"$$$(H)"/.config}
	@FILE=$${$(P):+$${$(P)%-}-}rc$${$(S):+-$${$(S)#-}}.lua
	@cp -v rc.lua $$CFG/$(A)/$$FILE
	@cp -rv functions $${$(I):-"$$$(H)"/.config}/$(A)/
