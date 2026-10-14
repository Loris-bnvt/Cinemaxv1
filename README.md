# Cinémax

Lecteur IPTV (Xtream) façon Netflix — chacun se connecte avec **son propre abonnement**. Cette page sert uniquement à télécharger l'application ; aucun contenu n'est fourni.

## Installer sur Android, Fire Stick ou Android TV

Lien toujours à jour vers la dernière version :

**https://github.com/Loris-bnvt/Cinemaxv1/raw/main/Cinemax.apk**

- **Téléphone / tablette Android** : ouvre le lien, télécharge, puis autorise l'installation quand Android le demande.
- **Fire Stick / Android TV** : installe l'app **Downloader** (AFTVnews), tape le lien ci-dessus, puis autorise Downloader à installer des applications inconnues.

## Installer sur une télé Samsung (Tizen)

Depuis un Mac avec Tizen Studio, sur le même Wi-Fi que la télé (mode développeur activé : Apps → 12345) :

1. Télécharge **[Cinemax-tizen.zip](https://github.com/Loris-bnvt/Cinemaxv1/raw/main/Cinemax-tizen.zip)** et **[install-sur-la-tele.sh](https://github.com/Loris-bnvt/Cinemaxv1/raw/main/install-sur-la-tele.sh)** dans *Téléchargements*.
2. Dans le Terminal : `cd ~/Downloads && chmod +x install-sur-la-tele.sh && ./install-sur-la-tele.sh <IP de la télé> Cinemax-tizen.zip`

Ensuite, ouvre Cinémax sur la télé : depuis le téléphone (même Wi-Fi), le bouton télé du lecteur propose « Cinémax sur la télé ».
