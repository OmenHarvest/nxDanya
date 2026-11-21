{ config, pkgs, ... }:

{
  programs.happ = {
    enable = true;

    # TUN создаёт виртуальный сетевой интерфейс для маршрутизации трафика.
    tunMode.enable = true;
  };
}
