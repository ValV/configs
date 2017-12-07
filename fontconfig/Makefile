# Automate config file installation/update

help:
	@printf "FontConfig custom configuration\n"
	@printf "Synopsis:\n"
	@printf "\tmake install\n\tsudo make install\n"

.ONESHELL:
install:
	@FILE=local.conf
	@TARGET=/etc/fonts/
	@if [[ "$$UID" -ge "1000" ]]; then
		FILE=fonts.conf;
		if [[ -d "$$XDG_CONFIG_HOME" ]]; then
			TARGET=$$XDG_CONFIG_HOME/fontconfig/
		else
			TARGET=~/.
		fi
	fi
	@echo cp -v local.conf "$$TARGET""$$FILE"
