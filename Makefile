_clone:
	git clone \
		--depth=1 \
		--single-branch \
		--no-tags \
		--filter=tree:0 \
		--sparse \
		$(GITHUB)/bitnami/containers.git

_config:
	git sparse-checkout set \
            bitnami/mysql \
            bitnami/postgresql \
            bitnami/redis \
            bitnami/redis-cluster \
            bitnami/rabbitmq \
            bitnami/kafka
list:
	 git sparse-checkout list

add:
	@test -n "$(word 2,$(MAKECMDGOALS))" || (echo "Usage: make add <name>"; exit 1)
	git sparse-checkout add bitnami/$(word 2,$(MAKECMDGOALS))
%:
	@:

add_upstream:
	git remote add upstream $(GITHUB)/bitnami/containers.git
	git fetch upstream main --depth=1
	git merge upstream/main

upstream:
	git pull --depth=1 upstream main
