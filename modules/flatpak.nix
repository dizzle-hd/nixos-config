{ pkgs, ... }:

{
  services.flatpak.enable = true;

  services.flatpak.packages = [
    "flathub:computer.helium.Helium"
  ];

  services.flatpak.update.auto.enable = true;
  services.flatpak.uninstallUnused = true;
}

