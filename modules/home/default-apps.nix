{ ... }:

let
  browser = "librewolf.desktop";
  fileManager = "thunar.desktop";
  editor = "codium.desktop";
  media = "mpv.desktop";
  mail = "thunderbird.desktop";
  torrent = "org.qbittorrent.qBittorrent.desktop";
  archive = "org.kde.ark.desktop";
in
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Web
      "text/html" = browser;
      "x-scheme-handler/http" = browser;
      "x-scheme-handler/https" = browser;
      "x-scheme-handler/about" = browser;
      "x-scheme-handler/unknown" = browser;

      # PDFs (LibreWolf has a built-in viewer)
      "application/pdf" = browser;

      # Folders
      "inode/directory" = fileManager;

      # Text and code
      "text/plain" = editor;
      "text/markdown" = editor;
      "application/json" = editor;
      "application/x-shellscript" = editor;

      # Video
      "video/mp4" = media;
      "video/x-matroska" = media;
      "video/webm" = media;
      "video/quicktime" = media;
      "video/x-msvideo" = media;

      # Audio
      "audio/mpeg" = media;
      "audio/flac" = media;
      "audio/ogg" = media;
      "audio/x-wav" = media;
      "audio/mp4" = media;

      # Mail
      "x-scheme-handler/mailto" = mail;
      "message/rfc822" = mail;

      # Torrents
      "x-scheme-handler/magnet" = torrent;
      "application/x-bittorrent" = torrent;

      # Archives
      "application/zip" = archive;
      "application/x-tar" = archive;
      "application/x-compressed-tar" = archive;
      "application/x-bzip2-compressed-tar" = archive;
      "application/x-xz-compressed-tar" = archive;
      "application/zstd" = archive;
      "application/x-7z-compressed" = archive;
      "application/vnd.rar" = archive;
    };
  };
  xdg.configFile."mimeapps.list".force = true;
}