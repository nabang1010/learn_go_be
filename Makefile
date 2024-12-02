postgresql:
	docker rm -f nabang1010_postgres

	docker run --name nabang1010_postgres \
			-p 5432:5432 \
			-e POSTGRES_USER=root \
			-e POSTGRES_PASSWORD=123456a@ \
			-d \
			--restart always \
			postgres:12-alpine

createdb:
	docker exec -it nabang1010_postgres createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it nabang1010_postgres dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:123456a@@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:123456a@@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgresql createdb dropdb migrateup migratedown sqlc test