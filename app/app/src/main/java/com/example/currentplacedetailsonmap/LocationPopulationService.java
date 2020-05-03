package com.example.currentplacedetailsonmap;

import android.app.IntentService;
import android.content.Intent;
import android.provider.Settings;
import android.util.Log;

import com.android.volley.AuthFailureError;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class LocationPopulationService extends IntentService {
    private String server = MapsActivityCurrentPlace.server;

    public LocationPopulationService() {
        super("LocationPopulation");
    }

    @Override
    protected void onHandleIntent(Intent workIntent) {
        Log.d("BACKGROUND SERVICE", "Sending location data to server...");
//        RequestQueue queue = Volley.newRequestQueue(this);
//        String url = server + "/add-data";
//
//        JSONObject jsonBody = new JSONObject();
//
//        try {
//            jsonBody.put("device_id", getDeviceId());
//        } catch (JSONException e) {
//            e.printStackTrace();
//        }
//
//        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(url, jsonBody,
//                new Response.Listener<JSONObject>() {
//                    @Override
//                    public void onResponse(JSONObject response) {
//                        Log.d("VOLLEY", response.toString());
//                    }
//                }, new Response.ErrorListener() {
//            @Override
//            public void onErrorResponse(VolleyError error) {
//                Log.e("VOLLEY", error.getMessage(), error);
//            }
//        }) { //no semicolon or coma
//            @Override
//            public Map<String, String> getHeaders() throws AuthFailureError {
//                Map<String, String> params = new HashMap<String, String>();
//                params.put("Content-Type", "application/json");
//                return params;
//            }
//        };
//
//        queue.add(jsonObjectRequest);
    }

    private String getDeviceId() {
        String androidId = Settings.Secure.getString(getContentResolver(), Settings.Secure.ANDROID_ID);
        return androidId;
    }
}
