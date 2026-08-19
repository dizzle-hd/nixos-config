{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    maple-mono.truetype
  ];

  # Add this block to set the system default monospace font
  fonts.fontconfig = {
    defaultFonts = {
      monospace = [ "Maple Mono" ];
    };
  };
}

