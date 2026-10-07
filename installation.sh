#!/usr/bin/env bash

set -euo pipefail

# Diretórios base
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${HOME}/.config"
BACKUP_DIR="${TARGET_DIR}/dotfiles_backup/backup_$(date +%Y%m%d_%H%M%S)"

# Cores para saída
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}==> Iniciando a instalação dos dotfiles...${NC}"

mkdir -p "${BACKUP_DIR}"

IGNORED=("." ".." ".git" "README.md" "installation.sh" "LICENSE")

is_ignored() {
    local item="$1"
    for ignore in "${IGNORED[@]}"; do
        if [[ "$item" == "$ignore" ]]; then
            return 0
        fi
    done
    return 1
}

backed_up_count=0

# 1. Criar links simbólicos para as pastas/arquivos do repositório
for item in "${DOTFILES_DIR}"/* "${DOTFILES_DIR}"/.*; do
    [ -e "$item" ] || continue
    
    name="$(basename "$item")"

    if is_ignored "$name"; then
        continue
    fi

    target_path="${TARGET_DIR}/${name}"

    if [ -e "${target_path}" ] || [ -L "${target_path}" ]; then
        if [ -L "${target_path}" ] && [ "$(readlink -f "${target_path}")" == "$(readlink -f "${item}")" ]; then
            echo -e "${BLUE}[IGNORADO]${NC} ${name} já está linkado."
            continue
        fi

        echo -e "${YELLOW}[BACKUP]${NC} Movendo ${target_path} para ${BACKUP_DIR}/"
        mv "${target_path}" "${BACKUP_DIR}/"
        backed_up_count=$((backed_up_count + 1))
    fi

    echo -e "${GREEN}[LINK]${NC} Linkando ${name} -> ${target_path}"
    ln -s "${item}" "${target_path}"
done

# 2. Inicializar arquivos dinâmicos (ignorados pelo git) caso não existam
echo -e "\n${BLUE}==> Verificando e inicializando arquivos de configuração dinâmicos...${NC}"

DYNAMIC_FILES=(
    "hypr/hyprland/colors/colors.conf"
    "hypr/hyprland/colors/pallette.txt"
    "kitty/kitty.conf"
    "rofi/launchers/type-1/shared/colors.rasi"
    "rofi/launchers/type-2/shared/colors.rasi"
    "rofi/launchers/type-3/shared/colors.rasi"
    "rofi/launchers/type-4/shared/colors.rasi"
    "rofi/powermenu/type-1/shared/colors.rasi"
    "rofi/powermenu/type-2/shared/colors.rasi"
    "rofi/powermenu/type-3/shared/colors.rasi"
    "rofi/powermenu/type-4/shared/colors.rasi"
    "themes/colorSchemes/.currentTheme"
    "waybar/launch.sh"
    "waybar/styles/colors/color.css"
)

for rel_path in "${DYNAMIC_FILES[@]}"; do
    target_file="${TARGET_DIR}/${rel_path}"

    # Garante que o diretório pai do arquivo exista
    mkdir -p "$(dirname "${target_file}")"

    if [ ! -f "${target_file}" ]; then
        echo -e "${YELLOW}[CRIANDO]${NC} Criando arquivo dinâmico inicial: ${rel_path}"
        touch "${target_file}"

        # Permissão de execução se for um script
        if [[ "${rel_path}" == *.sh ]]; then
            chmod +x "${target_file}"
        fi
    else
        echo -e "${BLUE}[OK]${NC} Arquivo dinâmico já existe: ${rel_path}"
    fi
done

# Limpeza de diretório de backup vazio
if [ "$backed_up_count" -eq 0 ]; then
    rm -rf "${BACKUP_DIR}"
    echo -e "\n${GREEN}✔ Instalação concluída sem necessidade de backups.${NC}"
else
    echo -e "\n${GREEN}✔ Instalação concluída!${NC}"
    echo -e "${YELLOW}📦 Backups salvos em:${NC} ${BACKUP_DIR}"
fi