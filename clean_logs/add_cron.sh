basepath=$(cd `dirname $0`; pwd)
echo "0 0 * * * "${basepath}"/clean_logs.sh >/dev/null 2>&1" &> crontest.cron
crontab crontest.cron
