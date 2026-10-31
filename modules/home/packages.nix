{ pkgs, ... }:

{
  home.packages = with pkgs; [
    
    # CLI Tools
    vim
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
    kdePackages.kdenlive
    obs-studio

    # Development
    claude-code
    godot

    # Text
    libreoffice

    # Password Managers
    keepassxc

    # Misc
    remmina
    bottles
    kdePackages.ark
    python3
    sshfs
    kubectl
    freelens-bin
    kubernetes-helm
    fluxcd
  ];
}
