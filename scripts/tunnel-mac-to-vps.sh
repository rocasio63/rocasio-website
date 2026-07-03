#!/bin/bash
# Auto SSH tunnel Mac → VPS (207.246.72.104)
# Ejecutar UNA VEZ en la Mac. Se reconecta solo si se cae.
# Para pararlo: pkill -f "autossh.*2222"

export AUTOSSH_PIDFILE=/tmp/hermes-vps-tunnel.pid
export AUTOSSH_LOGFILE=/tmp/hermes-vps-tunnel.log
export AUTOSSH_POLL=30
export AUTOSSH_PORT=0

echo "Iniciando túnel SSH Mac → VPS..."
echo "Puerto local 2222 → VPS 207.246.72.104"
echo "Log: /tmp/hermes-vps-tunnel.log"
echo "Para parar: pkill -f 'autossh.*2222'"

autossh -M 0 -f -N \
  -o "ServerAliveInterval 30" \
  -o "ServerAliveCountMax 3" \
  -o "ExitOnForwardFailure yes" \
  -R 2222:localhost:22 \
  root@207.246.72.104
