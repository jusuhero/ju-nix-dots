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

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

	  general = {
	    gaps_in = 5;
      gaps_out = 10; 
      border_size = 2;
      layout = "dwindle";
	  };
    
    decoration = {
      shadow_offset = "0 5";
    };

    bindm = [
    	"$mod, F, exec, firefox"
      "$mod SHIFT, Q, exit"
      "$mod, D, exec, discord"
      "$mod, E, exec, thunar"
      "$mod, Q, killactive"
      "$mod, L, exec, hyprlock"
    ];
   };
}
