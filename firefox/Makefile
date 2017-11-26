# Firefox config install

.ONESHELL:

install:
	@unalias -a
	@shopt -s nullglob
	@for IDIR in ~/.mozilla/firefox/*.default; do
		mkdir -pv $$IDIR/chrome
		cp -v userContent.css $$IDIR/chrome
	done

uninstall:
	@unalias -a
	@shopt -s nullglob
	@for IDIR in ~/.mozilla/firefox/*.default; do
		rm -rv $$IDIR/chrome #/userContent.css
	done
