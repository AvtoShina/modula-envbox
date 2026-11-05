#!/usr/bin/env bash
set -euo pipefail

RED=$'\e[31m'
GREEN=$'\e[32m'
YELLOW=$'\e[33m'
BLUE=$'\e[34m'
RESET=$'\e[0m'

usage() {
    cat <<EOF
Usage: $0 <dev|prod> [--reset]

  dev      Build & start the dev stack (api/${TARGET}.Dockerfile, front/dev.Dockerfile)
  prod     Build & start the prod stack

Options:
  --reset  Stop & remove existing containers for this project before starting
EOF
    exit 1
}

[[ $# -lt 1 ]] && { echo "${RED}Error: no target.${RESET}"; usage; }

TARGET="$1"
RESET_FLAG="${2:-}"

case "$TARGET" in
    dev|prod) ;;
    *) echo "${RED}Error: invalid target '$TARGET' (expected dev|prod).${RESET}"; usage ;;
esac

[[ "$RESET_FLAG" != "" && "$RESET_FLAG" != "--reset" ]] && {
    echo "${RED}Error: unknown option '$RESET_FLAG'.${RESET}"; usage
}

PROJECT="modula-${TARGET}"

# --- Preflight: .env must exist and have the critical keys ---
if [[ ! -f .env ]]; then
    echo "${RED}Error: .env not found in $(pwd).${RESET}"
    exit 1
fi

required=(SITE_DOMAIN API_DOMAIN API_DIR FRONT_DIR NGINX_PORT API_PORT DB_PORT API_INTERNAL_PORT)
missing=()
for k in "${required[@]}"; do
    grep -qE "^${k}=.+" .env || missing+=("$k")
done
if (( ${#missing[@]} )); then
    echo "${RED}Error: .env is missing or has empty values:${RESET} ${missing[*]}"
    exit 1
fi

echo "${BLUE}→ Target:  ${TARGET}${RESET}"
echo "${BLUE}→ Project: ${PROJECT}${RESET}"

if [[ "$RESET_FLAG" == "--reset" ]]; then
    echo "${YELLOW}→ Stopping existing '$PROJECT' stack...${RESET}"
    docker compose -p "$PROJECT" down --remove-orphans || true
fi

echo "${BLUE}→ Building & starting...${RESET}"
if TARGET="$TARGET" docker compose -p "$PROJECT" up -d --build; then
    echo "${GREEN}✔ '$TARGET' stack is up (project: $PROJECT).${RESET}"
    docker compose -p "$PROJECT" ps
else
    echo "${RED}✘ Build/start failed for '$TARGET'.${RESET}"
    echo "${YELLOW}→ Last 50 log lines:${RESET}"
    docker compose -p "$PROJECT" logs --tail=50 || true
    exit 1
fi
