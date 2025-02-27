#!/run/current-system/sw/bin/bash
# Add timestamp and more verbose logging
echo "$(date) - QEMU HOOK CALLED" >>/tmp/qemu-hook.log
echo "Arg 1 (VM name): ${1}" >>/tmp/qemu-hook.log
echo "Arg 2 (operation): ${2}" >>/tmp/qemu-hook.log
echo "All args: $@" >>/tmp/qemu-hook.log

if [ "${1}" = "rhel8.0-QRadar" ]; then
	echo "$(date) - Match found for rhel8.0-QRadar" >>/tmp/qemu-hook.log

	# Qradar on 44333
	GUEST_IP="192.168.122.100"
	GUEST_PORT="443"
	HOST_PORT="44333"

	if [ "${2}" = "stopped" ] || [ "${2}" = "reconnect" ]; then
		echo "$(date) - Removing rules for ${1}" >>/tmp/qemu-hook.log
		iptables -D FORWARD -o virbr0 -p tcp -d $GUEST_IP --dport $GUEST_PORT -j ACCEPT
		iptables -t nat -D PREROUTING -p tcp --dport $HOST_PORT -j DNAT --to $GUEST_IP:$GUEST_PORT
		echo "$(date) - Rules removed" >>/tmp/qemu-hook.log
	fi

	if [ "${2}" = "start" ] || [ "${2}" = "reconnect" ]; then
		echo "$(date) - Adding rules for ${1}" >>/tmp/qemu-hook.log
		iptables -I FORWARD -o virbr0 -p tcp -d $GUEST_IP --dport $GUEST_PORT -j ACCEPT
		iptables -t nat -I PREROUTING -p tcp --dport $HOST_PORT -j DNAT --to $GUEST_IP:$GUEST_PORT
		echo "$(date) - Rules added" >>/tmp/qemu-hook.log
	fi
fi
