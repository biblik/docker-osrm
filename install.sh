#!/bin/bash

# created by biblik<axel.grimault@gmail.com>

export PROFILE_LUA=$(find /opt/osrm/profile/ -type f -name '*.lua')
export DATA_OSM_PBF=$(find /opt/osrm/data/ -type f -name '*.pbf')

echo $PROFILE_LUA
echo $DATA_OSM_PBF

cd /opt/osrm/osrm-backend/build

ln -s $PROFILE_LUA profile.lua
ln -s ../profiles/lib/

./osrm-extract -p profile.lua $DATA_OSM_PBF

export DATA_OSM_OSRM=$(find /opt/osrm/data/ -type f -name '*.osrm')

echo $DATA_OSM_OSRM

./osrm-contract $DATA_OSM_OSRM

./osrm-routed $DATA_OSM_OSRM --max-table-size=2000
