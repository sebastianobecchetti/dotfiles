#!/bin/bash
#
# Script per installare i dotfiles usando 'stow',
# SVUOTANDO prima il contenuto delle cartelle di destinazione.
#
set -e # Interrompe lo script se un comando fallisce

# --- CONFIGURAZIONE ---

# La cartella che CONTIENE i pacchetti (nvim, hypr, kitty, ecc.)
STOW_DIR="$HOME/dotfiles/.config"

# La cartella "base" di destinazione.
BASE_TARGET_DIR="$HOME/.config"

# La lista dei pacchetti da installare.
PACKAGES_TO_STOW=(
    "nvim"
    "hypr"
    "kitty"
    "tmux"
)

# --- LOGICA DELLO SCRIPT ---

echo "Inizio installazione dotfiles..."
echo "-----------------------------------"

# Cicla attraverso ogni pacchetto definito nella lista
for pkg in "${PACKAGES_TO_STOW[@]}"; do

    echo "▶ Elaborazione pacchetto: $pkg"

    # Definisci il percorso di destinazione finale
    TARGET_DIR="$BASE_TARGET_DIR/$pkg"

    # --- 1. Pulizia del CONTENUTO della cartella ---
    echo "  Pulizia del *contenuto* di: $TARGET_DIR"

    # Se la cartella non esiste, creala.
    if [ ! -d "$TARGET_DIR" ]; then
        echo "  Cartella $TARGET_DIR non trovata. Creazione..."
        mkdir -p "$TARGET_DIR"
    fi

    # Ora che siamo sicuri che la cartella esista, svuotiamo il suo contenuto
    # Usiamo 'find' perché 'rm -rf *' non prende i file nascosti (dotfiles)
    # e 'rm -rf .*' ha problemi con '.' e '..'
    #
    # -mindepth 1: Inizia dal contenuto, non dalla cartella stessa
    # -delete: Elimina quello che trova
    echo "  Svuotamento in corso..."
    find "$TARGET_DIR" -mindepth 1 -delete

    echo "  Contenuto eliminato. La cartella è pronta."

    # --- 2. Esecuzione di Stow ---
    echo "  Avvio di 'stow' per $pkg..."

    # Esegue il comando 'stow'
    stow -d "$STOW_DIR" -t "$TARGET_DIR" "$pkg"

    echo "  Pacchetto '$pkg' installato con successo."
    echo "-----------------------------------"

done

echo "✅ Installazione completata per tutti i pacchetti."
