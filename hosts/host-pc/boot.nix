{ ... }:

{
  # Конфигурация рассчитана на загрузку в режиме UEFI, не Legacy BIOS.
  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";

      # Включи, если GRUB должен находить другие установленные ОС.
      useOSProber = false;
    };
  };
}
