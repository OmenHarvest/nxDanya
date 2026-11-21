{ config, pkgs, lib, ... }:

{
  # NetworkManager позволяет настраивать сеть через KDE и nmtui.
  networking.networkmanager.enable = true;

  # Брандмауэр лучше оставить включённым; нужные порты открывают отдельные модули.
  networking.firewall.enable = true;
}
