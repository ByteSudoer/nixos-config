HOSTNAME=$(shell hostname)

ifndef HOSTNAME
	$(error Hostname unknown)
endif

all: clean format check

build:
	sudo nixos-rebuild switch --flake .#${HOSTNAME} && notify-send "Update Done"
check:
	nix flake check
clean:
	rm -f ./nixos.qcow2
	rm -rf ./result  && ./scripts/clean_configs.sh

format:
	nix fmt

test:
	sudo nixos-rebuild test --verbose --flake .#${HOSTNAME}

plasma:
	nix run github:nix-community/plasma-manager > ./home/common/desktop/plasma/default.nix
unlock:
	rm -f ./flake.lock

update:
	nix flake update --commit-lock-file

vm:
	sudo nixos-rebuild build-vm --verbose --flake .#${HOSTNAME}
