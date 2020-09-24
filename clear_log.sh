#! /bin/bash

# curl -s https://raw.githubusercontent.com/pedroaugustoferreira/ocp3/master/clear_log.sh | bash -s --

cat > /usr/local/bin/clear_json_log.sh << EOF
#! /bin/bash
ls  /var/lib/docker/containers/*/*-json.log | awk '{print "> "$0}'|sh 
EOF

chmod +x /usr/local/bin/clear_json_log.sh

echo "0 5 * * * /usr/local/bin/clear_json_log.sh &> /tmp/clear_json_log.log" >> /var/spool/cron/root

ls -la /usr/local/bin/clear_json_log.sh

crontab -l |grep clear_json_log
