{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    helix
    zed-editor
    # VSCodium — OSS-сборка VS Code от сообщества, по умолчанию использует Open VSX.
    vscodium
    # Раскоментируй когда будешь делать ребилд с включенным vpn
    # jetbrains.idea
    # jetbrains.rider
  ];
}
