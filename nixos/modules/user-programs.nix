{ config, pkgs, ... }: {
	users.users.Nex = {
    packages = with pkgs; [
	obsidian
	vscodium
	opencode
	prismlauncher
	firefox
    ];
  };
}

