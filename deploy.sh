#!/bin/sh
set -e

GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

echo $(date -u) "${CYAN}Remove old build assets${NC}"
rm -rf ./dist && rm -rf ./node_modules
echo $(date -u) "${GREEN}...success${NC}"

echo $(date -u) "${CYAN}Clean yarn cache and install packages${NC}"
yarn cache clean && yarn install;
echo $(date -u) "${GREEN}...success${NC}"

echo $(date -u) "${CYAN}Generate Nuxt static application${NC}"
yarn run generate;
echo $(date -u) "${GREEN}Successfully generated${NC}"

exit 0;
