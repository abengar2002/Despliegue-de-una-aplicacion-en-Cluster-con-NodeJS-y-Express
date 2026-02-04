#!/bin/bash

# --- 1. ACTUALIZAR E INSTALAR ---
echo ">>> Actualizando e instalando BIND9 y utilidades..."
apt update
apt install -y bind9 dnsutils

# --- 2. FORZAR IPv4 (Punto 4 de la guía) ---
echo ">>> Configurando BIND para usar solo IPv4..."
sed -i 's/OPTIONS="-u bind"/OPTIONS="-u bind -4"/' /etc/default/named

# --- 3. COPIAR ARCHIVOS DE CONFIGURACIÓN ---
echo ">>> Copiando archivos de configuración..."

# Copiamos desde la carpeta /vagrant/config (el proyecto) 
# al sistema de la VM.
cp /vagrant/config/named.conf.options /etc/bind/
cp /vagrant/config/named.conf.local /etc/bind/
cp /vagrant/config/antonio.test.dns /var/lib/bind/
cp /vagrant/config/antonio.test.rev /var/lib/bind/

# --- 4. AJUSTAR PERMISOS DE ZONA ---
echo ">>> Ajustando permisos de los archivos de zona..."
chown bind:bind /var/lib/bind/antonio.test.dns
chown bind:bind /var/lib/bind/antonio.test.rev

# --- 5. REINICIAR SERVICIO ---
echo ">>> Reiniciando BIND9..."
systemctl restart bind9

echo ">>> ¡Servidor DNS provisionado!"