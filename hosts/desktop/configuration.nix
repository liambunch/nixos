{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules

    ../../modules/nixos
  ];

  system.stateVersion = "26.05";
}
