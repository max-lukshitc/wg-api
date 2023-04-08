for d in ../../profiles/*/ ; do
        export PUBLICKEY=$(cat $d/publickey)
        export ALLOWED_IP=$(grep -E -o  "10\.([0-9]{1,3}[\.]){2}[0-9]{1,3}" $d/wg0.conf)
        echo "wg set wg0 peer $PUBLICKEY allowed-ips $ALLOWED_IP/32"
        wg set wg0 peer $PUBLICKEY allowed-ips $ALLOWED_IP/32
done
