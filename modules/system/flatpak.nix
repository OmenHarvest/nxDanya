{ pkgs, ... }:

{
  services.flatpak.enable = true;

  # Автоматически добавляет системный репозиторий Flathub после запуска сети.
  # Этот блок можно удалить, если Flathub настраивается вручную.
  systemd.services.flatpak-flathub = {
    description = "Configure Flathub remote";

    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    path = [ pkgs.flatpak ];

    script = ''
      flatpak remote-add --if-not-exists --system \
        flathub \
        https://dl.flathub.org/repo/flathub.flatpakrepo
    '';

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
  };
}
