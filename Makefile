TF_CMD = tofu

init:
	@$(TF_CMD) init
up:
	@$(TF_CMD) apply -var 'running=true'
down:
	@$(TF_CMD) apply -var 'running=false'
reest:
	@(TF_CMD) destroy -var 'running=false' -auto-approve
	@sudo virsh undefine cp-1 worker-1 worker-2 --nvram --managed-save -snapshots=metadata --remove-all-storage || true
	@sudo virsh net-destroy k8snet || true
	@sudo virsh net-undefine k8snet || true
	@sudo rm -f /var/lib/libvirt/images/*.qcow2 /var/lib/libvirt/images/*.iso

