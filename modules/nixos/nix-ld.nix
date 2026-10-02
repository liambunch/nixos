{ pkgs, ... }:

{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    openssl
    icu
    curl
    libunwind
    libx11
    libxcursor
    libxext
    libxi
    libxinerama
    libxrandr
    libxscrnsaver
    libxxf86vm
    libxkbcommon
    wayland
    libdecor
    libglvnd
    vulkan-loader
    alsa-lib
    libpulseaudio
    udev
    dbus
    glib
    cairo
    pango
    harfbuzz
    gtk3
  ];
}
