{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    ./modules
    ../../private
  ];

  system.stateVersion = "26.05";
}
