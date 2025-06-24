#!/bin/bash

# Variables
RG="rg-lab-redes"
LOCATION="eastus"
VNET1="vnet1-lab"
VNET2="vnet2-lab"
SUBNET1="subnet1"
SUBNET2="subnet2"
VM1="vm1-lab"
VM2="vm2-lab"
NSG1="nsg1-lab"
NSG2="nsg2-lab"
IP1="ip1-lab"
IP2="ip2-lab"
NIC1="nic1-lab"
NIC2="nic2-lab"
USERNAME="azureuser"
PASSWORD="Password1234!"

# Iniciar sesión
az login

# Crear RG
echo "🛠️ Creando grupo de recursos..."
az group create --name $RG --location $LOCATION --tags proyecto=lab_redes autor=gmtech

# Crear VNets y Subnets
echo "🌐 Creando redes virtuales..."
az network vnet create --name $VNET1 --resource-group $RG --location $LOCATION \
  --address-prefix 10.0.0.0/16 --subnet-name $SUBNET1 --subnet-prefix 10.0.1.0/24

az network vnet create --name $VNET2 --resource-group $RG --location $LOCATION \
  --address-prefix 10.1.0.0/16 --subnet-name $SUBNET2 --subnet-prefix 10.1.1.0/24

# Crear peering
echo "🔗 Estableciendo peering..."
az network vnet peering create --name peer-vnet1-to-vnet2 --resource-group $RG \
  --vnet-name $VNET1 --remote-vnet $VNET2 --allow-vnet-access

az network vnet peering create --name peer-vnet2-to-vnet1 --resource-group $RG \
  --vnet-name $VNET2 --remote-vnet $VNET1 --allow-vnet-access

# Crear NSG y reglas SSH
echo "🔐 Configurando NSG y reglas..."
az network nsg create --name $NSG1 --resource-group $RG --location $LOCATION
az network nsg rule create --nsg-name $NSG1 --resource-group $RG --name Allow-SSH --priority 1000 \
  --protocol Tcp --destination-port-range 22 --access Allow --direction Inbound

az network nsg create --name $NSG2 --resource-group $RG --location $LOCATION
az network nsg rule create --nsg-name $NSG2 --resource-group $RG --name Allow-SSH --priority 1000 \
  --protocol Tcp --destination-port-range 22 --access Allow --direction Inbound

# Crear IPs públicas
echo "🌍 Creando IPs públicas..."
az network public-ip create --name $IP1 --resource-group $RG --location $LOCATION --sku Basic
az network public-ip create --name $IP2 --resource-group $RG --location $LOCATION --sku Basic

# Crear NICs
echo "🔌 Creando interfaces de red..."
az network nic create --name $NIC1 --resource-group $RG --vnet-name $VNET1 --subnet $SUBNET1 \
  --network-security-group $NSG1 --public-ip-address $IP1

az network nic create --name $NIC2 --resource-group $RG --vnet-name $VNET2 --subnet $SUBNET2 \
  --network-security-group $NSG2 --public-ip-address $IP2

# Crear VMs
echo "💻 Creando máquinas virtuales..."
az vm create --name $VM1 --resource-group $RG --location $LOCATION --nics $NIC1 \
  --image Ubuntu2204 --admin-username $USERNAME --admin-password $PASSWORD --size Standard_B1s

az vm create --name $VM2 --resource-group $RG --location $LOCATION --nics $NIC2 \
  --image Ubuntu2204 --admin-username $USERNAME --admin-password $PASSWORD --size Standard_B1s

echo "✅ Laboratorio creado correctamente."
