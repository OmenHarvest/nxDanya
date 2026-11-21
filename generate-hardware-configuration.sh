#!/usr/bin/env bash

# Запуск: bash generate-hardware-configuration.sh
# Файл создаётся для текущего ПК в hosts/host-pc/hardware-configuration.nix.
# Аргумент vm меняет каталог на hosts/vm; VM-конфигурацию нужно добавить отдельно.

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${SCRIPT_DIR}/hosts/host-pc"

if [[ "${1:-}" == "vm" ]]; then
    TARGET_DIR="${SCRIPT_DIR}/hosts/vm"
fi

if [[ ! -d "$TARGET_DIR" ]]; then
    mkdir -p "$TARGET_DIR"
fi

echo "Generating config for: $TARGET_DIR"

sudo nixos-generate-config \
    --show-hardware-config \
    > "$TARGET_DIR/hardware-configuration.nix"
