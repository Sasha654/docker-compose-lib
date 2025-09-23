@echo off

call :topic system.local.topic-1
call :topic system.local.topic-2
call :topic system.local.topic-3

pause
exit

:topic <name>
docker exec kafka sh -c "/opt/bitnami/kafka/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic %~1"
goto :eof