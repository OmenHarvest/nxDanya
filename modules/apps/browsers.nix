{ pkgs, zen-browser, helium, ... }:

{
  # Браузеры приходят из внешних inputs в flake.nix. Удали строку ненужного браузера.
  environment.systemPackages = [
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    helium.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
