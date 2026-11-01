{ ... }:

{
  imports = [
    ./disks.nix
    ./networking.nix
    ./ollama.nix
    ./packages.nix
    ./users.nix
    ./virtualisation.nix
  ];
}
