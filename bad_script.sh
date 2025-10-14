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
