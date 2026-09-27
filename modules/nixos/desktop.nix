{ config, lib, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      foot 
      wofi
      swaylock
      grim
      slurp
      wl-clipboard
    ];
  };

  services.displayManager.ly.enable = true;

  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
      settings.screencast = {
        chooser_type = "dmenu";
        chooser_cmd = "${pkgs.wofi}/bin/wofi --dmenu";
      };
    };
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
    config.sway.default = lib.mkForce [ "wlr" "gtk" ];
  };
}