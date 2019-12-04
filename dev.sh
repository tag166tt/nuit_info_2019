#!/bin/bash

echo "Pulling changes from all submodules"
git submodule update --init --recursive
git submodule update --recursive --remote

echo "Rebuilding images"
docker-compose build

echo "Starting"
docker-compose up
