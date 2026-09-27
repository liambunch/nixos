{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    ./modules
  ];

  system.stateVersion = "26.05";
}
