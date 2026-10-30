{ pkgs, ... }:

{
  imports = [
    ../../modules/home
    ./home
  ];

  home.packages = with pkgs; [
    heroic
  ];

  home.stateVersion = "26.05";
}
