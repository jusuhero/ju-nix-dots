{ config, pkgs, hyprland, ... }:

{
  # Enable Hyprland
  imports = [
    hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.package = pkgs.hyprland;
  wayland.windowManager.hyprland.xwayland.enable = true;
  wayland.windowManager.hyprland.systemd.enable = true;
  wayland.windowManager.hyprland.systemd.variables = ["--all"];

  home.sessionVariables = {
     NIXOS_OZONE_WL = "1";
     XDG_CURRENT_DESKTOP = "Hyprland";
     XDG_SESSION_DESKTOP = "Hyprland";
     XDG_SESSION_TYPE = "wayland";
     QT_QPA_PLATFORM = "wayland";
     QT_AUTO_SCREEN_SCALE_FACTOR = "1";
     SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/ssh-agent.socket";
     MOZ_ENABLE_WAYLAND = "1";
     MOZ_DISABLE_RDD_SANDBOX = "1";
   };

  home.packages = with pkgs; [
    waybar
    hyprlock
    kitty
  ];

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}
