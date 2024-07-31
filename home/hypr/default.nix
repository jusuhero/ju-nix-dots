{ config, pkgs, hyprland, ... }:

{
  # Enable Hyprland
  imports = [
    hyprland.homeManagerModules.default
  ];
  
  home.packages = with pkgs; [
    waybar
    hyprlock
    kitty
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

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "swww-daemon"
      "swaync &"
      "copyq &"
    ];

    input = {
      kb_layout = "de,us";
      kb_options = "grp:alt_shift_toggle";
      numlock_by_default = true;
      follow_mouse = 1;
      sensitivity = 0;
      touchpad = {
        natural_scroll = false;
      };
    };

    general = {
      "$mainMod" = "SUPER";
      layout = "dwindle";
      gaps_in = 0;
      gaps_out = 0;
      border_size = 2;
      "col.active_border" = "rgb(cba6f7) rgb(94e2d5) 45deg";
      "col.inactive_border" = "0x00000000";
      border_part_of_window = true;
      no_border_on_floating = false;
    };
  };
}
