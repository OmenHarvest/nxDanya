{ config, pkgs, lib, ... }:

{
  virtualisation.docker = {
    enable = true;

    # Еженедельно удаляет неиспользуемые данные Docker.
    # Отключи autoPrune, если нужно сохранять остановленные контейнеры и неиспользуемые образы.
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
