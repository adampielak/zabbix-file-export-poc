docker-compose up -d

echo -n Waiting for Zabbix to come up

while ! (echo > /dev/tcp/127.0.0.1/10051) >/dev/null 2>&1
do
  echo -n .
  sleep 1
done

echo

echo "Sleeping 30 seconds to allow Zabbix to actually start"
for i in `seq 1 30`; do echo -n .; sleep 1; done
echo

echo "Importing static hosts"
sh import_hosts.sh

echo "Restarting agent so that it picks up configuration"
docker-compose restart zabbix-agent

echo "Sleeping for 15 seconds so they agent can send some data"
for i in `seq 1 10`; do echo -n .; sleep 1; done
echo

echo "And here are your files"
sh list_files.sh
