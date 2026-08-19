{ config, pkgs, ... }: {
  users.users.julian = {
    packages = with pkgs; [
	obsidian
	vscodium
	opencode
	prismlauncher
	firefox
    ];
  };
}

