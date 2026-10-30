{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules

    ../../modules/nixos

    ../../private
  ];

  system.stateVersion = "26.05";
}
