.PHONY: exercise-up
exercise-up:
	docker compose -f ./docker-compose.exercise.yaml up --build --wait

.PHONY: exercise-down
exercise-down:
	docker compose -f ./docker-compose.exercise.yaml down > /dev/null 2>&1

.PHONY: exercise-restart
exercise-restart:
	make exercise-down
	make exercise-up
