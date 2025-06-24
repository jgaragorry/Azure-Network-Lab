#!/bin/bash

RG="rg-lab-redes"

echo "⚠️ Vas a eliminar todos los recursos del grupo $RG"
read -p "¿Estás seguro? (y/n): " confirm

if [[ "$confirm" != "y" ]]; then
  echo "❌ Operación cancelada."
  exit 1
fi

# Eliminar grupo de recursos y esperar
echo "🧨 Eliminando recursos..."
az group delete --name $RG --yes --no-wait

echo "⏳ Espera unos minutos hasta que finalice la eliminación..."
az group wait --name $RG --deleted

echo "✅ Recursos eliminados correctamente."
