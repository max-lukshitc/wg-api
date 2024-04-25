wg-quick down wg0
rm /etc/wireguard/wg0.conf
bash /app/wg-api/scripts/bash/wg.sh -i

systemctl link /app/wg-api/wgapi.service
systemctl start wgapi.service
for d in /app/wg-api/profiles/*/ ; do
        export PUBLICKEY=$(cat $d/publickey)
        export ALLOWED_IP=$(grep -E -o  "10\.([0-9]{1,3}[\.]){2}[0-9]{1,3}" $d/wg0.conf)
        echo "wg set wg0 peer $PUBLICKEY allowed-ips $ALLOWED_IP/32"
        wg set wg0 peer $PUBLICKEY allowed-ips $ALLOWED_IP/32
done

