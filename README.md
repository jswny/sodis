# Sodis
A social distancing app built to show you how well you are social distancing.

## Structure
There are two components to Sodis, a client app for Android and a Server. The client app is located in `app/` and the server is located in `server/`.

## Installation
To install the app, simply open it up in Android Studio and install it to the appropriate device using the "run" button.

To install the server, do the following steps in order:
1. Install the [Elixir Lanugage](https://elixir-lang.org/getting-started/introduction.html)
2. CD into the `server/` directory
3. Install the dependencies: `mix local.rebar && mix local.hex && mix deps.get`
4. Run the server with `mix run --no-halt`
5. The server runs on port `4000`

## Endpoints
The server defines three HTTP endpoints as follows:
- `POST /add-data`
  - Submits device data for a particular location
  - Sample request: `curl --header "Content-Type: application/json" --request POST --data '{"device_id": "123", "location_id": "loc1", "bluetooth_ids": [1, 2, 3]}' http://localhost:4000/add-data`
- `POST /get-score`
  - Calculates the social distancing score for a given device
  - Sample request: `curl --header "Content-Type: application/json" --request POST --data '{"device_id": "123"}' http://localhost:4000/get-score`
- `POST /get-num-locations`
  - Calculates the total number of locations for a given device
  - Sample request `curl --header "Content-Type: application/json" --request POST --data '{"device_id": "123"}' http://localhost:4000/get-num-locations`
