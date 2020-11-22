local:
	docker-compose -p dd_local --env-file ./.env.local \
	-f docker-compose.yml \
	-f docker-compose.local.yml down

	docker-compose -p dd_local --env-file ./.env.local \
	-f docker-compose.yml \
	-f docker-compose.local.yml up -d --build

prod:
	docker-compose -p dd_prod --env-file ./.env.prod \
	-f docker-compose.yml down

	docker-compose -p dd_prod --env-file ./.env.prod \
	-f docker-compose.yml up -d --build

logs:
	docker-compose -p dd_$(env) --env-file ./.env.$(env) logs -f

tear:
	docker-compose -p dd_$(env) --env-file ./.env.$(env) \
	-f docker-compose.yml \
	-f docker-compose.$(env).yml down