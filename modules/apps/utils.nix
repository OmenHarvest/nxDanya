{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Исходный набор
    git
    curl
    wget
    btop
    yazi
    fastfetch

    # Работа с файлами
    rsync
    file
    tree
    ncdu

    # Поиск и просмотр
    ripgrep
    fd
    fzf
    bat

    # Обработка данных
    jq
    yq-go

    # Архивы
    zip
    unzip
    p7zip
    unrar
    zstd

    # Терминальные сессии и редактирование
    tmux
    nano
  ];
}
