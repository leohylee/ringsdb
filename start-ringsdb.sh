#!/bin/bash
cd /Users/leo/Projects/ringsdb
docker-compose up -d
echo "RingsDB starting..."
sleep 5
echo "RingsDB is ready at http://localhost:8001"
