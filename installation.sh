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
NC='\033[0m' # No Color

echo -e "${BLUE}==> Iniciando a instalação dos dotfiles...${NC}"

# Garantir que o diretório de backup exista se necessário
mkdir -p "${BACKUP_DIR}"

# Itens/Arquivos do repositório a serem ignorados
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

# Loop por todos os itens do repositório
for item in "${DOTFILES_DIR}"/* "${DOTFILES_DIR}"/.*; do
    [ -e "$item" ] || continue
    
    name="$(basename "$item")"

    if is_ignored "$name"; then
        continue
    fi

    target_path="${TARGET_DIR}/${name}"

    # Se já existir uma configuração ou link simbólico antigo no destino
    if [ -e "${target_path}" ] || [ -L "${target_path}" ]; then
        # Se for um link simbólico apontando exatamente para onde queremos, pula
        if [ -L "${target_path}" ] && [ "$(readlink -f "${target_path}")" == "$(readlink -f "${item}")" ]; then
            echo -e "${BLUE}[IGNORADO]${NC} ${name} já está linkado corretamente."
            continue
        fi

        echo -e "${YELLOW}[BACKUP]${NC} Movendo ${target_path} para ${BACKUP_DIR}/"
        mv "${target_path}" "${BACKUP_DIR}/"
        backed_up_count=$((backed_up_count + 1))
    fi

    # Criar o link simbólico
    echo -e "${GREEN}[LINK]${NC} Linkando ${name} -> ${target_path}"
    ln -s "${item}" "${target_path}"
done

# Remover pasta de backup caso nenhum arquivo antigo tenha sido sobrescrito
if [ "$backed_up_count" -eq 0 ]; then
    rm -rf "${BACKUP_DIR}"
    echo -e "\n${GREEN}✔ Instalação concluída sem necessidade de backups.${NC}"
else
    echo -e "\n${GREEN}✔ Instalação concluída!${NC}"
    echo -e "${YELLOW}📦 Backups salvos em:${NC} ${BACKUP_DIR}"
fi