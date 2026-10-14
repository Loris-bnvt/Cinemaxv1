#!/bin/bash
# Installe Cinémax sur la télé Samsung depuis le Mac.
# Usage : ./install-sur-la-tele.sh <adresse IP de la télé> <fichier Cinemax-tizen.zip> [profil de certificat]
set -e

TV_IP="$1"
ZIP="$2"
PROFILE="$3"
TIZEN_HOME="${TIZEN_HOME:-$HOME/tizen-studio}"
TIZEN="$TIZEN_HOME/tools/ide/bin/tizen"
SDB="$TIZEN_HOME/tools/sdb"

if [ -z "$TV_IP" ] || [ -z "$ZIP" ]; then
  echo "Usage : $0 <IP de la télé> <Cinemax-tizen.zip> [profil]"
  exit 1
fi
if [ ! -x "$TIZEN" ]; then
  echo "Tizen Studio introuvable dans $TIZEN_HOME (installe-le ou indique TIZEN_HOME=…)"
  exit 1
fi

# profil de certificat : celui indiqué, sinon le profil actif de Tizen Studio
if [ -z "$PROFILE" ]; then
  PROFILE="$("$TIZEN" security-profiles list 2>/dev/null | awk '$2 == "O" {print $1}' | head -1)"
fi

WORK="$(mktemp -d)"
unzip -q "$ZIP" -d "$WORK/app"
echo "▶ Signature de l'app avec le profil « $PROFILE »…"
"$TIZEN" package -t wgt -s "$PROFILE" -- "$WORK/app"
WGT="$(ls "$WORK"/app/*.wgt | head -1)"

echo "▶ Connexion à la télé $TV_IP…"
"$SDB" connect "$TV_IP"
DEVICE="$("$SDB" devices | awk -v ip="$TV_IP" '$1 ~ ip {print $3}' | head -1)"
if [ -z "$DEVICE" ]; then
  echo "Télé introuvable : vérifie le mode développeur (Apps > 12345) et que l'IP du Mac y est bien indiquée."
  exit 1
fi

echo "▶ Installation sur « $DEVICE »…"
"$TIZEN" install -n "$(basename "$WGT")" -t "$DEVICE" -- "$WORK/app"
echo "✓ Cinémax est installé : ouvre-le depuis les applications de la télé."
