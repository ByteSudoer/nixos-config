#!/run/current-system/sw/bin/bash

echo "qemu-hook: ${1} ${2}" >>/tmp/qemu-hook.log

if [ "${1}" = "rhel8.0-QRadar" ]; then
  # Qradar on 44333
  GUEST_IP="192.168.122.100"
  GUEST_PORT="443"
  HOST_PORT="44333"
  if [ "${2}" = "stopped" ] || [ "${2}" = "reconnect" ]; then
    iptables -D FORWARD -o virbr0 -p tcp -d $GUEST_IP --dport $GUEST_PORT -j ACCEPT
    iptables -t nat -D PREROUTING -p tcp --dport $HOST_PORT -j DNAT --to $GUEST_IP:$GUEST_PORT
  fi
  if [ "${2}" = "start" ] || [ "${2}" = "reconnect" ]; then
    iptables -I FORWARD -o virbr0 -p tcp -d $GUEST_IP --dport $GUEST_PORT -j ACCEPT
    iptables -t nat -I PREROUTING -p tcp --dport $HOST_PORT -j DNAT --to $GUEST_IP:$GUEST_PORT
  fi
fi
