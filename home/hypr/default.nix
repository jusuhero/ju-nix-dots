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
      border_part_of_window = true;
      no_border_on_floating = false;
    };
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    bind = [
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      "CTRL_ALT, Return, exec, kitty --start-as-fullscreen -o 'font_size=25' --title all_is_kitty"
      "ALT, Return, exec, kitty --single-instance"
      "CTRL_ALT, T, exec, kitty --title fly_is_kitty"

      "$mainMod, L, exec, hyprlock"
      "$mainMod, F, exec, firefox"
      "$mainMod, D, exec, discord"
      "$mainMod, E, exec, thunar"
      "$mainMod, Q, killactive"
      "$mainMod, S, togglefloating"
      "$mainMod, R, exec, kitty -e ranger --cmd 'set show_hidden true'"
      "$mainMod, G, togglegroup"
      "$mainMod, tab, changegroupactive"

      "$mainMod, F1, pseudo,"
      "$mainMod, F2, togglesplit,"

      "ALT, right, movefocus, r"
      "ALT, left, movefocus, l"
      "ALT, up, movefocus, u"
      "ALT, down, movefocus, d"

      "$mainMod, up, movewindow, u"
      "$mainMod, down, movewindow, d"
      "$mainMod, left, movewindow, l"
      "$mainMod, right, movewindow, r"
      "$mainMod SHIFT, left, movetoworkspace, e-1"
      "$mainMod SHIFT, right, movetoworkspace, e+1"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"

      "$mainMod CTRL, left, resizeactive, -20 0"
      "$mainMod CTRL, right, resizeactive, 20 0"
      "$mainMod CTRL, up, resizeactive, 0 -20"
      "$mainMod CTRL, down, resizeactive, 0 20"

      
    ];
  };
}
