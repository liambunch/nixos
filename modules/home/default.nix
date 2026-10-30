{ ... }:

{
  imports = [
    ./packages.nix
    ./git.nix
    ./vscodium.nix
    ./sway.nix
    ./waybar.nix
    ./bluetooth.nix
    ./mako.nix
    ./polkit.nix
    ./gtk.nix
    ./default-apps.nix
  ];
}
