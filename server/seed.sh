#!/bin/bash

curl --header "Content-Type: application/json" --request POST --data '{"device_id": "f0c8d23b5e9789b9", "location_id": "loc1", "bluetooth_ids": [1, 2, 3]}' http://localhost:4000/add-data

curl --header "Content-Type: application/json" --request POST --data '{"device_id": "f0c8d23b5e9789b9", "location_id": "loc2", "bluetooth_ids": [1, 2, 3]}' http://localhost:4000/add-data

curl --header "Content-Type: application/json" --request POST --data '{"device_id": "f0c8d23b5e9789b9", "location_id": "loc1", "bluetooth_ids": [4, 5, 6]}' http://localhost:4000/add-data

curl --header "Content-Type: application/json" --request POST --data '{"device_id": "f0c8d23b5e9789b9", "location_id": "loc3", "bluetooth_ids": [1, 2, 3]}' http://localhost:4000/add-data

echo ""

curl --header "Content-Type: application/json" --request POST --data '{"device_id": "f0c8d23b5e9789b9"}' http://localhost:4000/get-score
