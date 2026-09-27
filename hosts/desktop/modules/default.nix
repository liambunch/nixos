{ ... }:

{
  imports = [
    ./networking.nix
    ./packages.nix
    ./users.nix
    ./virtualisation.nix
    ./smb.nix
  ];
}
