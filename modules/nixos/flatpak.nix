{ ... }:

{
  # Flatpak
  services.flatpak = {
    enable = true;
    packages = [
      "com.bitwarden.desktop"
    ];
    uninstallUnmanaged = true;
  };
}
