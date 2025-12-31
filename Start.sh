#!/bin/bash

# Penetrační setup pro Ubuntu / Debian
# Autor: [Tvoje jméno / GitHub uživatel]
# Licence: MIT

echo "=================================================="
echo "Penetrační setup pro Ubuntu / Debian"
echo "Instaluje nástroje: nmap, aircrack-ng, metasploit, hydra, hashcat, atd."
echo "=================================================="
echo

# 1. Aktualizace systému
echo "[1/4] Aktualizuji systém..."
apt update && apt upgrade -y
if [ $? -ne 0 ]; then
    echo "Chyba při aktualizaci systému, ukončuji." >&2
    exit 1
fi

# 2. Instalace běžných nástrojů
echo "[2/4] Instaluji penetrační nástroje..."

apt install -y \
    nmap \
    aircrack-ng \
    metasploit-framework \
    hydra \
    hashcat \
    sqlmap \
    john \
    wireshark \
    netcat-traditional \
    tcpdump \
    dsniff \
    ettercap-graphical \
    theharvester \
    dirb \
    gobuster \
    burpsuite \
    nikto \
    enum4linux \
    smbclient \
    openvpn \
    openvas \
    exploitdb \
    seclists \
    wordlists \
    curl \
    wget \
    git \
    vim \
    htop \
    tmux \
    zsh

if [ $? -ne 0 ]; then
    echo "Chyba při instalaci nástrojů, pokračuji dál." >&2
fi

# 3. Nastavení české klávesnice
echo "[3/4] Nastavuji českou klávesnici..."

# Nastaví českou klávesnici pro aktuální relaci
setxkbmap -layout cz

# Trvalé nastavení (do ~/.profile nebo ~/.bashrc)
echo "setxkbmap -layout cz" >> /home/$SUDO_USER/.profile

echo "Česká klávesnice je nastavena (trvale pro uživatele $SUDO_USER)."

# 4. Nastavení rozlišení obrazovky
echo "[4/4] Nastavení rozlišení obrazovky"
echo "Zadej rozlišení ve formátu ŠxV (např. 1920x1080):"
read -p "Rozlišení: " RESOLUTION

# Zkontroluj, že vstup je ve správném formátu
if [[ ! "$RESOLUTION" =~ ^[0-9]+x[0-9]+$ ]]; then
    echo "Neplatný formát rozlišení, použiji výchozí."
else
    echo "Hledám dostupná rozlišení..."
    xrandr | grep -E "^[^ ]+ connected" -A 1 | grep -E " [0-9]+x[0-9]+"
    
    echo "Nastavuji rozlišení na $RESOLUTION..."
    xrandr -s "$RESOLUTION"
    
    if [ $? -eq 0 ]; then
        echo "Rozlišení úspěšně nastaveno na $RESOLUTION."
    else
        echo "Nepodařilo se nastavit rozlišení $RESOLUTION, možná není podporováno."
    fi
fi

echo
echo "=================================================="
echo "Instalace dokončena!"
echo "Doporučuji restartovat systém pro plné fungování."
echo "=================================================="

