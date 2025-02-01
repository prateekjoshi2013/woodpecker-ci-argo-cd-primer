start-ci:
	docker compose -f woodpecker-compose.yaml up -d

stop-ci:
	docker compose -f woodpecker-compose.yaml down


cluster-setup:
	minikube start --nodes=3 --cpus=4 --memory=8192 --disk-size=50g

cluster-start:
	minikube start

cluster-stop:
	minikube stop

inst-nfs:
	helm upgrade --install \
    --namespace kube-system \
    --set persistence.enabled=true \
    --set persistence.size=40Gi \
    --set storageClass.name=nfs \
    --set storageClass.allowVolumeExpansion=true \
	--set persistence.accessMode=ReadWriteMany \
    --version 1.8.0 \
    nfs-server-provisioner \
    nfs-ganesha-server-and-external-provisioner/nfs-server-provisioner



