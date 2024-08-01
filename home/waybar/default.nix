{ config, pkgs, lib, stylix }:

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
    background: rgb(${config.stylix.base16Scheme.baseDE});
  }
''

stylix.targets.waybar.enable = true;
}
