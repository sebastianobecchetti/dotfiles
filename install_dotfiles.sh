#!/usr/bin/env bash
#
# Script definitivo per installare i dotfiles.
# Usa la logica "Adopt & Restore" per risolvere i conflitti a favore del repo.
#

# --- Configurazione e Sicurezza ---
set -e          # Interrompe lo script se un comando fallisce.
set -u          # Errore se usi variabili non definite.
set -o pipefail # Rileva errori nelle pipe.

# Colori per l'output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 1. Posizionamento nella directory dei dotfiles
# Calcola dove si trova questo script e si sposta lì.
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DOTFILES_DIR" || { echo -e "${RED}Errore: Impossibile entrare in $DOTFILES_DIR${NC}"; exit 1; }

echo -e "${BLUE}▶ Configurazione dotfiles da: ${DOTFILES_DIR}${NC}"

# 2. Controllo pre-requisiti
if ! command -v stow &> /dev/null; then
    echo -e "${RED}Errore: GNU Stow non è installato. Installalo prima!${NC}"
    exit 1
fi

if ! command -v git &> /dev/null; then
    echo -e "${RED}Errore: Git non è installato. Necessario per il ripristino.${NC}"
    exit 1
fi

# 3. Lista dei pacchetti
# 'scripts' è la cartella che conterrà il file .local/bin/env
PACKAGES=(
    "bash"
    "ghostty"
    "hypr"
    "nvim"
    "tmux"
    "walker"
    "waybar"
    "scripts"
)

echo -e "${BLUE}Pacchetti da installare: ${NC}${PACKAGES[*]}"

# 4. Avviso di sicurezza
echo -e "${YELLOW}⚠️  ATTENZIONE: Questo script sovrascriverà i file di configurazione locali"
echo -e "con quelli presenti in questo repository.${NC}"
read -p "Vuoi procedere? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Operazione annullata dall'utente."
    exit 1
fi

# 5. Funzione di installazione
install_package() {
    local pkg=$1

    # Controlla se la cartella esiste prima di provare a fare lo stow
    if [ ! -d "$pkg" ]; then
        echo -e "${YELLOW}Avviso: La cartella '$pkg' non esiste nei dotfiles. Salto.${NC}"
        return
    fi

    echo -e "${BLUE}Processing: $pkg${NC}"

    # Esegue Stow con --adopt per prendere possesso dei file esistenti
    # -R: Restow (pulisce vecchi link)
    # -t: Target (la home dell'utente)
    # --no-folding: Crea link per ogni file, non per intere cartelle (più sicuro)
    stow --adopt -v -R -t "$HOME" --no-folding "$pkg"
}

# 6. Esecuzione del loop
for pkg in "${PACKAGES[@]}"; do
    install_package "$pkg"
done

# 7. Ripristino dei file originali del repo
# Poiché --adopt ha modificato i file nel repo con il contenuto locale,
# usiamo git restore per scartare quelle modifiche e ripristinare le versioni pulite del repo.
echo -e "${BLUE}Ripristino le versioni originali dal repository git...${NC}"
git restore .

echo -e "${GREEN}✅ Installazione completata con successo!${NC}"
