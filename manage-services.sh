#!/bin/bash

# Шлях до кореневої директорії проекту
ROOT_DIR="/mnt/c/Users/Oleksandr/OneDrive/vps_home_sasha"

# Шлях до глобального .env файлу
GLOBAL_ENV="$ROOT_DIR/.env"

# Список директорій з docker-compose.yml файлами
SERVICES=("traefik" "n8n_upd" "portainer")

# Функція для виконання docker-compose команди для всіх сервісів
run_command_all() {
    for service in "${SERVICES[@]}"; do
        echo "Running '$1' for $service"
        (cd "$ROOT_DIR/$service" && docker compose --env-file "$GLOBAL_ENV" $1)
    done
}

# Функція для виконання docker-compose команди для конкретного сервісу
run_command_single() {
    if [[ " ${SERVICES[@]} " =~ " $1 " ]]; then
        echo "Running '$2' for $1"
        (cd "$ROOT_DIR/$1" && docker compose --env-file "$GLOBAL_ENV" $2)
    else
        echo "Service $1 not found"
    fi
}

# Перевірка аргументів
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 [up|down|restart] [service_name]"
    exit 1
fi

# Перевірка наявності глобального .env файлу
if [ ! -f "$GLOBAL_ENV" ]; then
    echo "Warning: Global .env file not found at $GLOBAL_ENV"
    echo "Proceeding without global environment variables"
fi

# Виконання команди
if [ "$#" -eq 1 ]; then
    run_command_all $1
elif [ "$#" -eq 2 ]; then
    run_command_single $2 $1
else
    echo "Invalid number of arguments"
    exit 1
fi