{ config, pkgs, lib, stylix }:

let 
  color_fg = "${stylix.base16Scheme.base0E}"
  color_sec = "${stylix.base16Scheme.base01}"
in
{
  home.packages = with pkgs; [
    waybar
  ];

  programs.waybar.enable = true;
  programs.waybar.settings = [
    {
      mainBar = {
        layer = "top";
        position = "top";

      };
    }
  ];

  programs.waybar.style = ''
    * {
      border: none;
      border-radius: 20;
    }
    window#waybar {
      background: rgb(${color_fg});
      color: rgb(${color_sec});
    }
  ''

  stylix.targets.waybar.enable = true;
}
