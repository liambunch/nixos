{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    virt-manager
    dnsmasq
  ];
}
