{ pkgs, ... }:

{
  programs.steam = {
    enable = true;

    # Эти опции открывают порты в брандмауэре. Установи false для функций,
    # которыми не пользуешься, особенно для выделенного сервера.
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    protontricks.enable = true;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamemode.enable = true;

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  environment.systemPackages = with pkgs; [
    lutris
    prismlauncher
    heroic
    mangohud
  ];
}
