{ inputs, pkgs, ...}:

{
	imports = [
		./audio.nix
		./stylix.nix
    ./pam.nix
    ./firewall.nix
	];


}
