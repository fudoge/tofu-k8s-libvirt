TF_CMD = tofu

up:
	@$(TF_CMD) apply -var 'running=true'
down:
	@$(TF_CMD) apply -var 'running=false'
