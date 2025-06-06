#!/usr/bin/env bash

RED=$'\e[31m'
GREEN=$'\e[32m'
YELLOW=$'\e[33m'
BLUE=$'\e[34m'
RESET=$'\e[0m'

show_usage(){
    echo "Usage: $0 [target]"
    echo "Where:"
    echo "   [target] - Target you want to build [dev, prod]"
    exit 1
}

# Check if target is provided
if [ -z "$1" ]; then
    echo "${RED}Error: No target specified.${RESET}"
    show_usage
fi

TARGET=$1

# Validate target
if [[ "$TARGET" != "dev" && "$TARGET" != "prod" ]]; then
    echo "${RED}Error: Invalid target '$TARGET'. Must be 'dev' or 'prod'.${RESET}"
    show_usage
fi

echo "${BLUE}Building '$TARGET' environment...${RESET}"

# Remove old containers if needed
docker compose down || echo "${YELLOW}Warning: No existing containers to stop.${RESET}"

# Build and start the selected environment
TARGET=$1 docker compose --profile="$TARGET" up --build

if [ $? -eq 0 ]; then
    echo "${GREEN}Build completed successfully for '$TARGET'!${RESET}"
else
    echo "${RED}Build failed for '$TARGET'. Check logs.${RESET}"
    exit 1
fi
