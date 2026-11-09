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
    sshfs

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
    python3

    # Kubernetes
    kubectl
    freelens-bin
    kubernetes-helm
    fluxcd

    # Text
    libreoffice

    # Password Managers
    keepassxc

    # Misc
    bottles
    kdePackages.ark
    heroic
  ];
}
