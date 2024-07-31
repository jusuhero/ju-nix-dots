{ hyprland, pkgs, ...}: {

  imports = [
    ./hypr
    ./hyprlock
    ./stylix.nix
    #./environment
  ];

  home = {
    username = "ju";
    homeDirectory = "/home/ju";
  };

  home.packages = (with pkgs; [
    
    #User Apps
    neovim
    nano
    rofi
    git
    firefox

    bibata-cursors
  ]);

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

  };

  programs.git = {
	enable = true;
	userName = "Justin";
	userEmail = "justin@ackermann.saarland";
  };

  programs.firefox.enable = true;
  programs.home-manager.enable = true;

  home.stateVersion = "23.05";
}
