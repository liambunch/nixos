{ pkgs, ... }:

{
  home.packages = with pkgs; [
    
    # CLI Tools
    neovim
    wget
    fastfetch
    bottom
    yt-dlp
    dig

    # Internet (Browsers, Mail, Messaging, etc)
    mullvad-vpn
    librewolf
    thunderbird
    vesktop
    nicotine-plus
    qbittorrent

    # Media
    vlc
    mpv
    kdePackages.gwenview

    # Text
    libreoffice

    # Password Managers
    keepassxc

    # Misc
    remmina
    bottles
    kdePackages.ark
  ];
}
