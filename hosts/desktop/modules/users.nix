{ ... }:

{
  users.users."liam" = {
    extraGroups = [ "docker" "vboxusers" ];
  };
}
