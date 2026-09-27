{ pkgs, ... }:

{
  # Sway doesn't set an icon theme, so GTK apps (Thunar, wofi) fall back to
  # hicolor and show almost no icons. Besides settings.ini, this writes the
  # dconf key that GTK actually reads on Wayland.
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };
}
