USER=bytesudoer

all: clean format check

build:
	sudo nixos-rebuild switch --verbose --flake .#${USER}
check:
	nix flake check
clean:
	rm -f ./nixos.qcow2
	rm -rf ./result  && ./scripts/clean_configs.sh

format:
	nix fmt

test:
	sudo nixos-rebuild test --verbose --flake .#${USER}

unlock:
	rm -f ./flake.lock

update:
	nix flake update

vm:
	sudo nixos-rebuild build-vm --verbose --flake .#${USER}
