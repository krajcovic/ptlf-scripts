#!/bin/bash

clear

APP="ptlf-worker-1.0.0-10-jar-with-dependencies.jar"
WORKING_DIR="/home/krajcovic/Releases/jptlf/20130306"
export EASORS_ROOT=$WORKING_DIR

# musi existovat!!!
mkdir $WORKING_DIR/asors
mkdir $WORKING_DIR/asors/tbo

# Help
# Vsechny prepinace nejsou stale realizovane.
# Nektere se proste nikdy nebudou vyuzivat, jsou tam z historickych  duvodu a budou postupne odstranovany
# Vzdy je naprosto nutne vedet co chces presne udelat
java -jar $APP -h

# Dulezity parametr -f znamena FAKE, je vygenerovane ptlf, ale nejsou provedeny zmeny v DB.

# AMEX - pouze data recordy
java -jar \
-Dapp.homeDir=$WORKING_DIR \
-Dapp.configDir=$WORKING_DIR \
$APP -a "af_uk_, ap_uk_" -b 130306 -t '3' -p g -f -q M100380201 -r 56406116

# OTHERS - pouze data recordy
java -jar \
-Dapp.homeDir=$WORKING_DIR \
-Dapp.configDir=$WORKING_DIR \
$APP -a "af_uk_, ap_uk_" -b 130306 -t '0' -p s -f -q M100380201 -r 56406116
