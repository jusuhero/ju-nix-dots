{ hyprland, pkgs, ...}: {

  imports = [
    ./hypr
    ./hyprlock
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
  ]);

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Tokyonight-Dark-B-LB";
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
