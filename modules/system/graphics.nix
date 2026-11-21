{ config, pkgs, ... }:

{

  # 32-битные библиотеки нужны Steam и другим 32-битным играм.
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Этот файл рассчитан на NVIDIA. Для AMD или Intel адаптируй весь модуль.
  # Используется и для Wayland, несмотря на название опции.
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    # GTX 1660 — Turing, поддерживает открытый модуль NVIDIA.
    # При проблемам с драйвером можно попробовать закрытый модуль: open = false.
    open = true;

    nvidiaSettings = true;

    # stable выбирает стабильную ветку драйвера из текущего nixpkgs.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.systemPackages = with pkgs; [
    vulkan-tools
  ];
}
