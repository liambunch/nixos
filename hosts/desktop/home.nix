{ pkgs, ... }:

{
  imports = [
    ../../modules/home
    ./home
  ];

  home.stateVersion = "26.05";
}
