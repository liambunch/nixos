{ config, lib, ... }:

let
  target = config.wayland.systemd.target;
in
{
  services.polkit-gnome.enable = true;

  systemd.user.services.polkit-gnome = {
    Unit.After = lib.mkForce [ target ];
    Unit.PartOf = lib.mkForce [ target ];
    Install.WantedBy = lib.mkForce [ target ];
  };
}
