{ pkgs, ... }:

{
  # Позволяет запускать динамически связанные бинарники, собранные не для NixOS.
  programs.nix-ld.enable = true;

  environment.variables = {
    LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";
  };

  # Wireshark и права на захват сетевого трафика.
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  environment.systemPackages = with pkgs; [
    # Python
    python3
    uv
    ruff
    basedpyright

    # Node.js
    nodejs
    pnpm

    # Rust
    rustup
    rust-analyzer

    # C/C++ & LLVM toolchain
    clang
    lld
    llvmPackages.bintools
    pkg-config

    # Java
    jdk25

    # Databases
    dbeaver-bin

    # API testing
    insomnia

    # AI coding
    opencode

    # Virtualization
    qemu

    # Отладка и анализ программ
    gdb
    strace
    ltrace
    patchelf

    # Реверс-инжиниринг
    ghidra

    # Сетевой анализ и тестирование
    nmap
    tcpdump
    netcat-openbsd
    socat

    # Тестирование безопасности веб-приложений
    burpsuite
  ];
}
