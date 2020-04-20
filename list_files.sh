docker run -it --rm -v $(docker volume ls | grep zabbix-export | awk '{print $2}'):/zabbix-export:ro -w /zabbix-export alpine ls -l
