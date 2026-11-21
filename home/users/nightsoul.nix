{ config, pkgs, lib, ... }:

{
  # Имя и домашний каталог должны совпадать с users.users в modules/system/users.nix.
  home.username = "nightsoul";
  home.homeDirectory = "/home/nightsoul";

  # Не меняй после первой установки: это версия формата пользовательских данных.
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  # Настройки терминала Kitty применяются только для этого пользователя.
  programs.kitty = {
    enable = true;

    shellIntegration.enableZshIntegration = true;

    settings = {
      # -1 отключает запрос подтверждения при закрытии окна.
      confirm_os_window_close = -1;
      enable_audio_bell = false;

      # Прозрачность фона: от "0.0" до "1.0".
      background_opacity = "0.75";
      dynamic_background_opacity = true;
      background_blur = 8;
    };
  };


}
