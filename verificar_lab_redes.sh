#!/bin/bash

RG="rg-lab-redes"

echo "🔍 Verificando recursos en el grupo: $RG"

echo "🌐 VNets y subnets:"
az network vnet list -g $RG -o table

echo "🔐 NSGs:"
az network nsg list -g $RG -o table

echo "🖥️ VMs:"
az vm list -g $RG -d -o table

echo "🌍 IP Públicas:"
az network public-ip list -g $RG --query "[].{Name:name, IP:ipAddress}" -o table

echo "✅ Verificación completa. Revisa el portal o intenta conectar con:"
echo "ssh azureuser@<IP-PUBLICA>"
