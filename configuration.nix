{ config, pkgs, lib, ... }:

{

  # Разрешает проприетарные пакеты, включая драйвер NVIDIA и часть приложений.
  nixpkgs.config.allowUnfree = true;

  imports = [
    # Генерируется на конкретном ПК скриптом generate-hardware-configuration.sh.
    ./hosts/host-pc/hardware-configuration.nix
    ./hosts/host-pc/boot.nix

    # Системные настройки можно отключать, убирая соответствующий импорт.
    ./modules/system/base.nix
    ./modules/system/network.nix
    ./modules/system/graphics.nix
    ./modules/system/users.nix
    ./modules/system/term.nix
    ./modules/system/docker.nix
    ./modules/system/flatpak.nix

    # Графическое окружение и экран входа.
    ./modules/desktop/kde.nix

    # Наборы приложений: каждый файл можно редактировать независимо.
    ./modules/apps/browsers.nix
    ./modules/apps/devtools.nix
    ./modules/apps/editors.nix
    ./modules/apps/gaming.nix
    ./modules/apps/media.nix
    ./modules/apps/social.nix
    ./modules/apps/torrent.nix
    ./modules/apps/vless.nix
  ];
}
