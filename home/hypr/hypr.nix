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

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    input = {
      kb_layout=de,us 
      kb_variant=fffff
      kb_model=
      kb_options= grp:alt_shift_toggle
      kb_rules = 
      follow_mouse = 1
      sensitivity = 0

      touchpad {
        natural_scroll = no
      };
    };

    decoration = {
      shadow_offfset = "0 5"
    };

    bindm = [
      "$mod, F, exec, firefox"
    ];

   };

}
