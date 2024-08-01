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

    animations {
      enabled = true;
      bezier = "overshot, 0.05, 0.9, 0.1, 1.05";
      bezier = "smoothOut, 0.36, 0, 0.66, -0.56";
      bezier = "smoothIn, 0.25, 1, 0.5, 1";

      animation = "windows, 1, 2, overshot, slide";
      animation = "windowsOut, 1, 7, default, popin 80%";
      animation = "border, 1, 10, default";
    };

    dwindle {
      no_gaps_when_only = false; 
      pseudotile = true;
      preserve_split = true;
    };

    general = {
      "$mainMod" = "SUPER";
      layout = "dwindle";
      gaps_in = 5;
      gaps_out = 5;
      border_size = 2;
      border_part_of_window = true;
      no_border_on_floating = false;
    };

    decoration = {
      rounding = 10;

      blur {
        enabled = true 
        size = 8
        passes = 3
      };

      drop-shadow = true; 
      shadow_range = 15;
      shadow_offset = 0,0;
      shadow_render_power = 3;
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true; 
      mouse_move_enables_dpms = true;
      enable_swallow = true 
      vfr = true 
      swallow_regex = ^(kitty)$
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

      "$mainMod SHIFT, Q, exit,"

      "$mainMod SHIFT, up, fullscreen, 1"
      "$mainMod SHIFT, down, fullscreen, 0"

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

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 0"
      "$mainMod, up, workspace, e+1"
      "$mainMod, down, workspace, e-1"

      "ALT,1,movetoworkspace,1"
      "ALT,2,movetoworkspace,2"
      "ALT,3,movetoworkspace,3"
      "ALT,4,movetoworkspace,4"
      "ALT,5,movetoworkspace,5"
      "ALT,6,movetoworkspace,6"
      "ALT,7,movetoworkspace,7"
      "ALT,8,movetoworkspace,8"
      "ALT,9,movetoworkspace,9"
      "ALT,0,movetoworkspace,10"
    ];
  };
}
