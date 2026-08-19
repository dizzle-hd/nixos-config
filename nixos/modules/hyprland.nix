{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;

  services.dbus.enable = true;

  environment.systemPackages = with pkgs; [
    wayland
    xwayland
    xdg-utils
    grim
    slurp
    wl-clipboard
    fuzzel
    kitty
    ghostty
    awww
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = false;
  };
}

