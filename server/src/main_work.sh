current_dir=$(dirname $0)
current_dir=$(cd "${current_dir}";pwd)

rm -rf ${current_dir}/logs
mkdir ${current_dir}/logs

# sh ${current_dir}/cron_work.sh

setsid uvicorn server:app --host 0.0.0.0 --port 80 --reload >> ${current_dir}/logs/uvicorn.log 2>&1 &

tail -f /dev/null

