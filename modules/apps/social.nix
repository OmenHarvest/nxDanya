{ pkgs, ... }:

{
  # Удаляй ненужные приложения из списка или добавляй свои пакеты из nixpkgs.
  environment.systemPackages = with pkgs; [
    vesktop
    telegram-desktop
  ];
}
