# SQL Query Tuning

Start Docker (postgres DB) `docker compose -f ./docker-compose.exercise.yaml up --build --wait`
```shell
make exercise-up
```


Down Docker (postgres DB) `docker compose -f ./docker-compose.exercise.yaml down > /dev/null 2>&1`
```shell
make exercise-down
```

Restart Docker (postgres DB)
```shell
make exercise-restart
```