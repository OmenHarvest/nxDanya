{ ... }:

{
  # Терминал, который открывают приложения. При смене терминала замени
  # и desktop-файл ниже, и команду в TERMINAL.
  xdg.terminal-exec = {
    enable = true;

    settings = {
      KDE = [
        "kitty.desktop"
      ];

      default = [
        "kitty.desktop"
      ];
    };
  };

  environment.sessionVariables = {
    TERMINAL = "kitty";
  };
}
