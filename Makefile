.PHONY: help
.DEFAULT_GOAL := help

help:
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: install
install: # Install all dependencies and build the programs
	scripts/setup-ansible
	ansible-playbook main.yml --ask-become

.PHONY: build
build: # Build the programs without checking dependencies
	ansible-playbook main.yml --ask-become --tags "clipnotify,clipmenu,dmenu,slock,slstatus,dwm"

.PHONY: clipmenu
clipmenu: # Build the clipmenu and clipnotify
	ansible-playbook main.yml --ask-become --tags "clipnotify,clipmenu"

.PHONY: dmenu
dmenu: # Build dmenu
	ansible-playbook main.yml --ask-become --tags "dmenu"

.PHONY: slock
slock: # Build slock
	ansible-playbook main.yml --ask-become --tags "slock"

.PHONY: slstatus
slstatus: # Build slstatus
	ansible-playbook main.yml --ask-become --tags "slstatus"

.PHONY: dwm
dwm: # Build dwm
	ansible-playbook main.yml --ask-become --tags "dwm"