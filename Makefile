.DEFAULT_GOAL:=install

PACKAGES=$(sort $(dir $(wildcard */)))
PACKAGES_INSTALL=$(foreach package,$(PACKAGES),$(package:/=)-install)
PACKAGES_RESOLVE=$(foreach package,$(PACKAGES),$(package:/=)-resolve)

.PHONY: install
install:
	stow -t ~ $(PACKAGES)

.PHONY: uninstall
uninstall:
	stow -Dt ~ $(PACAKGES)

.PHONY: update
update: pull install

.PHONY: pull
pull:
	git pull


# Holy sh*t use it carefully!!
$(PACKAGES_RESOLVE):
	 stow $(subst -resolve,,$@) 2>&1 | tail -n +2 | head -n -1 | awk '{print "/home/grayscale/"$$11}' | xargs rm -rf 

$(PACKAGES:/=):
	stow -t ~ $@
