{ ... }:

{
  imports = [
    ./boot.nix
    ./networking.nix
    ./locale.nix
    ./desktop.nix
    ./audio.nix
    ./bluetooth.nix
    ./services.nix
    ./flatpak.nix
    ./users.nix
    ./packages.nix
    ./nix-ld.nix
    ./nix.nix
  ];
}
