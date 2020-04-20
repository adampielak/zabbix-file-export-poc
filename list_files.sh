CMD="docker run -it --rm -v $(docker volume ls | grep zabbix-export | awk '{print $2}'):/zabbix-export:ro alpine"

echo $CMD

echo "Here are your files"
$CMD ls -l /zabbix-export

echo
echo "And here is the head of history-history-syncer-1.ndjson"
$CMD head /zabbix-export/history-history-syncer-1.ndjson 
