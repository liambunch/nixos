{ ... }:

{
  imports = [
    ./packages.nix
    ./git.nix
    ./vscodium.nix
    ./sway.nix
    ./waybar.nix
    ./bluetooth.nix
    ./gtk.nix
    ./default-apps.nix
  ];
}
