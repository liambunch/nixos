{ ... }:

{
  boot.initrd.luks.devices."root".allowDiscards = true;
  boot.initrd.luks.devices."home".allowDiscards = true;
}
