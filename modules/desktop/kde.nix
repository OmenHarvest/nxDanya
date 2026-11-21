{ pkgs, ... }:

{
  # KDE Plasma 6.
  services.desktopManager.plasma6.enable = true;

  # Wayland-сессия Plasma по умолчанию. Для X11 используй "plasmax11".
  services.displayManager.defaultSession = "plasma";

  # Экран входа.
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    extraPackages = [
      pkgs.kdePackages.qt5compat
    ];
  };

  # qylock оставляем для оформления SDDM.
  # Блокировку пользовательской сессии обеспечивает KDE.
  programs.qylock = {
    enable = true;

    # Тема оформления qylock для SDDM.
    theme = "sword";

    sddm.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
    xdg-utils
    cups-pk-helper

    papirus-icon-theme
    hicolor-icon-theme
    colloid-icon-theme
    tela-circle-icon-theme

    # Скриншоты и запись экрана средствами KDE.
    kdePackages.spectacle
  ];

  # Накопители и подключение файловых систем.
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # Нативный KDE Connect
  programs.kdeconnect = {
    enable = true;
  };

  # Звук: оставляем твои настройки PipeWire.
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  xdg.icons.enable = true;

  # Portal-бэкенд KDE подключается модулем Plasma.
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
  };
}
