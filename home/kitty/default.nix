{ config, pkgs, lib, hyprland, ... }:

{
  
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      window_padding_width = 10;
    };
  };

  stylix.targets.kitty.enable = true;

 }
