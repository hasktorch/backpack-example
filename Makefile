dev:
	sos -p '(raw|core|examples)/[^.].*' -c "rm -rf dist-newstyle && cabal new-build all"
