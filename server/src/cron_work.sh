current_dir=$(dirname $0)
current_dir=$(cd "${current_dir}";pwd)

python3 ${current_dir}/task/cron_cut_log.py &

