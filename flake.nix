{
  description = "nix workstation config";

  inputs = {
    # Ветка Nixpkgs определяет версии системы и большинства пакетов.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    qylock.url = "github:Darkkal44/qylock";

    # Ветка Home Manager должна соответствовать ветке Nixpkgs.
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helium = {
      url = "github:oxcl/nix-flake-helium-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    happ-nix = {
      url = "github:DaHL-gh/happ-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    zen-browser,
    helium,
    spicetify-nix,
    happ-nix,
    qylock,
    ...
  }: {
    # Имя конфигурации используется в команде: nixos-rebuild switch --flake .#host-pc
    nixosConfigurations.host-pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit
          zen-browser
          helium
          spicetify-nix
          qylock
          ;
      };

      modules = [
        spicetify-nix.nixosModules.default
        happ-nix.nixosModules.default
        qylock.nixosModules.default

        ./configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";

          # Имя пользователя здесь должно совпадать с modules/system/users.nix.
          home-manager.users.nightsoul =
            import ./home/users/nightsoul.nix;
        }
      ];
    };
  };
}
