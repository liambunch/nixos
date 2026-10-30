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
    ./nix-ld.nix
    ./nix.nix
  ];
}
