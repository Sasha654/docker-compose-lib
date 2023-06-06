rem Docker-контейнер YDB хранит данные в файловой системе контейнера, разделы которой отражаются на директории в хост-системе. 
rem Приведенная ниже команда запуска контейнера создаст файлы в текущей директории, поэтому перед запуском создайте рабочую директорию, и выполняйте запуск из неё.
@echo off
docker run -d --rm --name ydb-local -h localhost -p 2135:2135 -p 8765:8765 -p 2136:2136 -v .\ydb_certs:/ydb_certs -v .\ydb_data:/ydb_data -e YDB_DEFAULT_LOG_LEVEL=NOTICE -e GRPC_TLS_PORT=2135 -e GRPC_PORT=2136 -e MON_PORT=8765 cr.yandex/yc/yandex-docker-local-ydb:latest
pause
