{ config, pkgs, lib, stylix }:

let
  waybarToggle = { args ? "", config ? "top" }:

    let
      barConfig = if config == "bottom" then {
        pidFile = "/tmp/waybar_bottom.pid";
        style = "${builtins.getEnv "HOME"}/.config/waybar/style-bottom.css";
        config = "${builtins.getEnv "HOME"}/.config/waybar/config-bottom.jsonc";
      } else {
        pidFile = "/tmp/waybar.pid";
        style = "${builtins.getEnv "HOME"}/.config/waybar/style.css";
        config = "${builtins.getEnv "HOME"}/.config/waybar/config.jsonc";
      };

      script = ''
        #!/bin/bash

        # Check if Waybar is already running
        if [ -e "${barConfig.pidFile}" ]; then
          # Kill the Waybar process using the stored PID
          pid=$(cat "${barConfig.pidFile}")
          if [ -n "$pid" ]; then
            kill "$pid"
            rm "${barConfig.pidFile}"
            echo "Waybar (${config}) stopped."
          else
            echo "Error: Unable to retrieve Waybar PID."
          fi
        else
          # Start Waybar with the specified arguments
          waybar -s "${barConfig.style}" -c "${barConfig.config}" &
          echo $! > "${barConfig.pidFile}"
          echo "Waybar (${config}) started with PID $!"
        fi
      '';
    in
      pkgs.writeScriptBin "waybar_toggle_${config}" script;

in
{
  home.packages = with pkgs; [
    waybar
    (waybarToggle { config = "top"; })
    (waybarToggle { config = "bottom"; })
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
      background: rgb(${config.stylix.base16Scheme.base0E});
    }
  ''

  stylix.targets.waybar.enable = true;
}
