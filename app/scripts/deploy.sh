#!/bin/sh

printf "Colocamos fichero ${GRAY}deploy.porc${NC}...\n"
echo "5" > web/deploy.porc

GREEN='\033[0;32m'
NC='\033[0m' # No Color
GRAY='\033[0;33m'

printf "${GREEN}Comenzamos el DEPLOY${NC}\n"
printf "${GREEN}La información se almacenará en el fichero web/deploy.out${NC}\n"
rm -f scripts/deploy.out
printf "                           \n"

# SCHEMA_UPDATE
printf "Ejecutando el script ${GRAY}schema_update${NC}...\n"
printf "${GRAY}+++++++++++++++++++++++++${NC}\n"
sh scripts/schema_update.sh >> scripts/deploy.out
printf "${GREEN}Ok ¿? ${NC}\n"

echo "10" > web/deploy.porc

# COMPOSER_INSTALL
printf "Ejecutando el script ${GRAY}composer_install${NC}...\n"
printf "${GRAY}+++++++++++++++++++++++++${NC}\n"
sh scripts/composer_install.sh >> scripts/deploy.out
printf "${GREEN}Ok ¿? ${NC}\n"

echo "30" > web/deploy.porc

# CACHE_CLEAR
printf "Ejecutando el script ${GRAY}cache_clear${NC}...\n"
printf "${GRAY}+++++++++++++++++++++++++${NC}\n"
sh scripts/cache_clear.sh >> scripts/deploy.out
printf "${GREEN}Ok ¿? ${NC}\n"

echo "60" > web/deploy.porc

# CACHE WARM
printf "Ejecutando el script ${GRAY}cache_warm${NC}...\n"
printf "${GRAY}+++++++++++++++++++++++++${NC}\n"
sh scripts/cache_warm.sh >> scripts/deploy.out
printf "${GREEN}Ok ¿? ${NC}\n"

echo "90" > web/deploy.porc

sleep 5

echo "100" > web/deploy.porc

# INDEX.HTML
printf "Quitamos fichero ${GRAY}deploy.porc${NC}...\n"
printf "${GRAY}+++++++++++++++++++++++++${NC}\n"
rm web/deploy.porc
printf "${GREEN}Ok ¿? ${NC}\n"

printf "   \n"
printf "${GRAY}Se supone que está correcto${NC}\n"