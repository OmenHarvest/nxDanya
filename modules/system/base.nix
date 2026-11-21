{ config, pkgs, lib, ... }:

{
  # Имя компьютера в сети. После изменения пересобери систему.
  networking.hostName = "host-pc";

  # Часовой пояс, например "Europe/Berlin" или "Asia/Almaty".
  time.timeZone = "Europe/Moscow";

  # Основной язык интерфейса системы.
  i18n.defaultLocale = "en_US.UTF-8";

  # Российские форматы даты, времени, чисел и валюты независимо от языка интерфейса.
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Раскладка текстовой консоли TTY; раскладка KDE настраивается отдельно.
  console.keyMap = "us";

  # Включает команды nix и поддержку flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Автоматическая еженедельная очистка старых объектов Nix.
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";

  # Не меняй после первой установки: это не версия пакетов NixOS.
  system.stateVersion = "26.05";
}
