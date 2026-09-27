{ ... }:

{
  services.mullvad-vpn.enable = true;
  services.resolved = {
    enable = true;
  };
  services.openssh.enable = true;
}
