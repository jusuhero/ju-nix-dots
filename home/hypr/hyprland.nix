{ config, pkgs, hyprland, ... }:

{
  # Enable Hyprland
  imports = [
    hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland.enable = true;

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };

  home.file.".config/hypr/hyprland.conf".source = ../hypr/hyprland.conf;
  home.file.".config/hypr/display.conf".source = ../hypr/display.conf;
  home.file.".config/hypr/keybinds.conf".source = ../hypr/keybinds.conf;
  home.file.".config/hypr/windowrules.conf".source = ../hypr/windowrules.conf;
  home.file.".config/hypr/env.conf".source = ../hypr/windowrules.conf;
  home.file.".config/hypr/styling.conf".source = ../hypr/styling.conf;
}
