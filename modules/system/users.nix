{ pkgs, lib, ... }:

{
  # При смене имени пользователя также обнови home/users/nightsoul.nix и flake.nix.
  users.users.nightsoul = {
    isNormalUser = true;
    description = "nightsoul";
    home = "/home/nightsoul";
    shell = pkgs.zsh;

    # Пароль применяется только при создании пользователя. После первого входа выполни: passwd
    initialPassword = "init";

    # wheel — sudo, networkmanager — управление сетью, docker — контейнеры,
    # wireshark — захват сетевого трафика. Удали группы, которые не нужны.
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "wireshark"
    ];
  };

  # true требует пароль пользователя при вызове sudo.
  security.sudo.wheelNeedsPassword = true;

  # Системная настройка Zsh: плагины и тема применяются ко всем пользователям Zsh.
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      theme = "";

      plugins = [
        "git"
        "docker"
        "docker-compose"
        "z"
      ];
    };

    interactiveShellInit = lib.mkAfter ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

      if [[ -f "$HOME/.p10k.zsh" ]]; then
        source "$HOME/.p10k.zsh"
      fi

      fastfetch
    '';
  };

  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k
    nerd-fonts.jetbrains-mono
    fastfetch
  ];
}
