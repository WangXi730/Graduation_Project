current_dir=$(dirname $0)
current_dir=$(cd "${current_dir}";pwd)

rm -rf ${current_dir}/logs
mkdir ${current_dir}/logs

cronFile="/etc/cron.d/e2scrub_all"

sed -i '$a\0 */24 * * * root python3 '${current_dir}'/task/cron_cut_log.py' ${cronFile}

setsid uvicorn server:app --host 0.0.0.0 --port 80 --reload >> ${current_dir}/logs/uvicorn.log 2>&1 &

tail -f /dev/null

