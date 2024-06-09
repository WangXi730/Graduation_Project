SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

#制作镜像
docker build -t g-server ${SCRIPT_DIR}/src/
docker build -t g-mysql ${SCRIPT_DIR}/mysql/

#使用docker启动镜像


