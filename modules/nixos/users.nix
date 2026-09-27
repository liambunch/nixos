{ ... }:

{
  users.users."liam" = {
    isNormalUser = true;
    description = "Liam Bunch";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.liam = import ../../hosts/desktop/home.nix;
    backupFileExtension = "backup";
  };
}
