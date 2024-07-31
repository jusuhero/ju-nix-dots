{ config, pkgs, hyprland, ... }:

{
  
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty.enable = true;

 }
