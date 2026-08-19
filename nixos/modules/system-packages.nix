{ pkgs, helium, ... }:

{
  environment.systemPackages = with pkgs; [
    	neovim
	git
	wayclip
	fastfetch
	fish
	waybar
	swaynotificationcenter
	ranger
	yazi
	gcc
	curl
	tree-sitter
	hypridle
	hyprlock
	playerctl
	hyprpicker
	cava
	overskride
	bluez
	mpv
	pwgen

	helium.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}

