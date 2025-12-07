#!/bin/bash
#
# Script per (re)installare i pacchetti di dotfiles usando GNU Stow.
#
set -e # Interrompe lo script se un comando fallisce.

echo "▶ Avvio installazione dei dotfiles..."

# Lista di tutti i pacchetti (cartelle) da installare.
PACKAGES=(
    "bash"
    "ghostty"
    "hypr"
    "nvim"
    "tmux"
    "walker"
    "waybar"
)

echo "Pacchetti da installare: ${PACKAGES[*]}"

# Comando Stow
# -R (--restow): Rimuove i link precedenti e ricrea i nuovi. Sicuro per gli aggiornamenti.
# -t ~: Imposta la cartella di destinazione alla home (~).
# -v: Output dettagliato per vedere cosa succede.
stow -R -t ~ -v "${PACKAGES[@]}"

echo "✅ Tutti i pacchetti sono stati installati con successo."