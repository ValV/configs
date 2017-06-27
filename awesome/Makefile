# Help to install config file

P=p
S=s
I=XDG_CONFIG_HOME
H=HOME
A=awesome

help:
	@printf "Awesome WM configuration rc.lua may be prefixed or suffixed\n"
	@printf "Synopsis:\n"
	@printf "\tmake install\n\tmake $(P)=prefix $(S)=suffix install\n"

install:
	@cp -v rc.lua \
$${$(I):-"$$$(H)"/.config}/$(A)/$${$(P):+$${$(P)%-}-}rc$${$(S):+-$${$(S)#-}}.lua
