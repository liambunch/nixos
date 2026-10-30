{ ... }:

{
  users.users."liam" = {
    extraGroups = [ "docker" "vboxusers" "libvirtd" ];
  };

  home-manager.users.liam = import ../home.nix;
}
