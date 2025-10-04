#!/bin/bash

NODE_REGGAETON="k3d-party-cluster-agent-0"
NODE_ROCK="k3d-party-cluster-agent-1"
NODE_TECHNO="k3d-party-cluster-agent-2"
NODE_SALSA="k3d-party-cluster-agent-3"

echo "🔥 Iniciando preparación de la fiesta en Kubernetes..."
echo "----------------------------------------------------"

echo "🎧 Paso 1: Creando las salas de fiesta (Namespaces)..."
kubectl create namespace reggaeton
kubectl create namespace rock
kubectl create namespace techno
kubectl create namespace salsa
echo "✅ Namespaces creados."
echo ""

echo "🎧 Paso 2: Definiendo el estilo musical (Labels)..."
kubectl label nodes $NODE_REGGAETON style=urbano --overwrite
kubectl label nodes $NODE_ROCK style=metalero --overwrite
kubectl label nodes $NODE_TECHNO style=electronico --overwrite
kubectl label nodes $NODE_SALSA style=latino --overwrite
echo "✅ Nodos etiquetados."
echo ""

echo "🎧 Paso 3: Poniendo los bouncers en la puerta (Taints)..."
kubectl taint nodes $NODE_REGGAETON music=perreo-intenso:NoSchedule --overwrite
kubectl taint nodes $NODE_ROCK music=guitarra-electrica:NoSchedule --overwrite
kubectl taint nodes $NODE_TECHNO music=bass-boost:NoSchedule --overwrite
kubectl taint nodes $NODE_SALSA music=sabor-latino:NoSchedule --overwrite
echo "✅ Taints aplicados a los nodos."
echo ""
