defmodule Sodis.Router do
  use Plug.Router

  @ets_table :place_data

  plug(:match)
  plug(:dispatch)

  get "/" do
    message = %{
      text: "Hello from the Sodis server"
    }

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(message))
  end

  post "/add-data" do
    params = conn.body_params

    device_id = params["device_id"]
    device_data = :ets.lookup(@ets_table, device_id)

    location_id = params["location_id"]
    bluetooth_ids = params["bluetooth_ids"]

    new_data = {
      location_id,
      MapSet.new(bluetooth_ids)
    }

    result =
      if device_data == [] do
        :ets.insert(@ets_table, {device_id, [new_data]})
      else
        current_data =
          :ets.lookup(@ets_table, device_id)
          |> Enum.at(0)
          |> elem(1)

        location_id_exists = Enum.any?(current_data, fn {loc_id, _bt_ids} -> loc_id == location_id end)

        combined_data =
          if location_id_exists do
            Enum.map(current_data, fn {loc_id, bt_ids} ->
              if loc_id == location_id do
                new_map_set = elem(new_data, 1)
                {loc_id, MapSet.union(bt_ids, new_map_set)}
              else
                {loc_id, bt_ids}
              end
            end)
          else
            [new_data | current_data]
          end

        :ets.insert(@ets_table, {device_id, combined_data})
      end

    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "#{result}")
  end

  match _ do
    send_resp(conn, 404, "Not found!")
  end
end
