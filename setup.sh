#!/bin/bash

BASE_DIR="$(pwd)"
NGINX_CONF="$BASE_DIR/config/nginx.conf"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[38;5;226m'
NC='\033[0m'

echo -e "${YELLOW}[INIT] Checking WAF structure...${NC}"


if [ ! -f "$NGINX_CONF" ]; then
    echo -e "${RED}[ERROR] Missing file: config/nginx.conf${NC}"
    echo -e "${YELLOW}To prevent Docker from crashing (folder/file conflict), you must create this file.${NC}"
    echo "Action :"
    echo "  cp config/nginx.conf.exemple config/nginx.conf"
    exit 1
fi


DIRS=(
    "$BASE_DIR/logs"
    "$BASE_DIR/config/owasp-crs/rules"
)

for dir in "${DIRS[@]}"; do
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
        echo -e "${GREEN}[+] Directory created: $dir${NC}"
    fi
done



FILES=(
    "$BASE_DIR/config/owasp-crs/crs-setup.conf"
)

for file in "${FILES[@]}"; do
    if [ ! -f "$file" ]; then
        touch "$file"
        echo -e "${GREEN}[+] Empty file initialized: $file${NC}"
    fi
done

chown -R $USER:$USER "$BASE_DIR"
chmod 755 "$BASE_DIR/"

echo -e "${GREEN}[OK] Local structure validated.${NC}"
