postgresql:
	docker rm -f nabang1010_postgres

	docker run --name nabang1010_postgres \
			-p 5432:5432 \
			-e POSTGRES_USER=root \
			-e POSTGRES_PASSWORD=123456a@ \
			-v ./postgres_db:/var/lib/postgresql/data \
			-d \
			--restart always \
			postgres:12-alpine

