dryrun:
	ansible-playbook -i hosts site.yaml -K --check --diff

deploy:
	ansible-playbook -i hosts site.yaml -K --diff

format-jobs:
	./scripts/format.sh
