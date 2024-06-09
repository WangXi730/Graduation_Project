SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

#制作镜像
docker build -t g-server ${SCRIPT_DIR}/src/
docker build -t g-mysql ${SCRIPT_DIR}/mysql/

#将镜像导入到kubernetes中
docker save -o ${SCRIPT_DIR}/g-mysql.tar g-mysql:latest
ctr -n=k8s.io images import ${SCRIPT_DIR}/g-mysql.tar
docker save -o ${SCRIPT_DIR}/g-server.tar g-server:latest
ctr -n=k8s.io images import ${SCRIPT_DIR}/g-server.tar

#启动应用
kubectl apply -f ${SCRIPT_DIR}/project_k8s.yaml
