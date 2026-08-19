{ pkgs, ... }:

{
  home.username = "julian";
  home.homeDirectory = "/home/julian";
  home.stateVersion = "26.05";

  xdg.configFile."hypr".source = ./dotfiles/hyprland;
  xdg.configFile."waybar".source = ./dotfiles/waybar;
  xdg.configFile."fuzzel".source = ./dotfiles/fuzzel;
  xdg.configFile."kitty".source = ./dotfiles/kitty;
  xdg.configFile."nvim".source = ./dotfiles/nvim;
  xdg.configFile."swaync".source = ./dotfiles/swaync;
  xdg.configFile."fish".source = ./dotfiles/fish;

  home.packages = with pkgs; [
  	
  ];
}
