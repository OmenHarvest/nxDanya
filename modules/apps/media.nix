{ pkgs, spicetify-nix, ... }:

let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.spicetify = {
    enable = true;

    # Здесь можно убирать или добавлять расширения Spicetify.
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle
    ];

    enabledCustomApps = with spicePkgs.apps; [
      newReleases
    ];
  };


  # OBS для записи экрана и стриминга.
  programs.obs-studio.enable = true;
}
