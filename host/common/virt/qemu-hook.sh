#!/run/current-system/sw/bin/bash
# Add timestamp and more verbose logging
echo "$(date) - QEMU HOOK CALLED" >>/tmp/qemu-hook.log
echo "Arg 1 (VM name): ${1}" >>/tmp/qemu-hook.log
echo "Arg 2 (operation): ${2}" >>/tmp/qemu-hook.log
echo "All args: $@" >>/tmp/qemu-hook.log

# IMPORTANT: Change the "VM NAME" string to match your actual VM Name.
# In order to create rules to other VMs, just duplicate the below block and configure
# it accordingly.
if [ "${1}" = "test-bridge" ]; then

  # Update the following variables to fit your setup
  BRIDGE_IFACE=virbr1
  HOST_IP=10.10.REDACTED.REDACTED
  GUEST_IP=10.10.REDACTED.REDACTED
  GUEST_PORT=
  HOST_PORT=

  if [ "${2}" = "stopped" ] || [ "${2}" = "reconnect" ]; then
    iptables -D FORWARD -o $BRIDGE_IFACE -d $GUEST_IP -j ACCEPT
    #/sbin/iptables -t nat -D PREROUTING -p tcp --dport $HOST_PORT -j DNAT --to $GUEST_IP:$GUEST_PORT
    iptables -t nat -D PREROUTING -d $HOST_IP -j DNAT --to-destination $GUEST_IP
    iptables -t nat -D POSTROUTING -s $GUEST_IP -j SNAT --to-source $HOST_IP
  fi
  if [ "${2}" = "start" ] || [ "${2}" = "reconnect" ]; then
    iptables -I FORWARD -o $BRIDGE_IFACE -d $GUEST_IP -j ACCEPT
    #/sbin/iptables -t nat -I PREROUTING -p tcp --dport $HOST_PORT -j DNAT --to $GUEST_IP:$GUEST_PORT
    iptables -t nat -A PREROUTING -d $HOST_IP -j DNAT --to-destination $GUEST_IP
    iptables -t nat -A POSTROUTING -s $GUEST_IP -j SNAT --to-source $HOST_IP
  fi
fi
