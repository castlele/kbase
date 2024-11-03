package com.castlelecs.consoleforecast;

import java.io.BufferedReader;
import java.io.FileReader;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import org.json.*;

public class ForecastInteractor {

    private static String FORECAST_API = "https://api.weather.yandex.ru/v2/forecast";
    private static String LAT_KEY = "lat";
    private static String LON_KEY = "lon";
    private static String LIMIT_KEY = "limit";
    private static String FORECAST_API_KEY = "X-Yandex-Weather-Key";
    private static String FORECAST_API_KEY_FILENAME = "../.weatherkey.txt";

    private HttpClient client = HttpClient.newHttpClient();

    public void getForecast(double lat, double lon, int limit) {
        try {
            HttpResponse<String> response = sendRequest(lat, lon, limit);
            getResults(response.body());

        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
    }

    private HttpResponse<String> sendRequest(double lat, double lon, int limit) throws Exception {
        HttpRequest request = HttpRequest
            .newBuilder()
            .uri(buildURI(lat, lon, limit))
            .header(FORECAST_API_KEY, readWeatherKey())
            .GET()
            .build();

        HttpResponse<String> response = client.send(
            request,
            HttpResponse.BodyHandlers.ofString()
        );

        return response;
    }

    private URI buildURI(double lat, double lon, int limit) throws Exception {
        return URIBuilder
            .fromString(FORECAST_API)
            .query(LAT_KEY, String.valueOf(lat))
            .query(LON_KEY, String.valueOf(lon))
            .query(LIMIT_KEY, String.valueOf(limit))
            .build();
    }

    private String readWeatherKey() throws Exception {
        FileReader fr = new FileReader(FORECAST_API_KEY_FILENAME);
        BufferedReader reader = new BufferedReader(fr);
        StringBuilder builder = new StringBuilder();
        int currentChar;

        while ((currentChar = reader.read()) != -1) {
            builder.append((char)currentChar);
        }

        reader.close();

        return builder.toString().trim();
    }

    private void getResults(String response) {
        System.out.println(response);

        JSONObject json = new JSONObject(response);

        getFactTemp(json);
        getAvarageTemp(json);
    }

    private void getFactTemp(JSONObject json) {
        int temp = json.getJSONObject("fact").getInt("temp");

        System.out.println("Current Temp: " + temp);
    }

    private void getAvarageTemp(JSONObject json) {
        JSONArray forecasts = json.getJSONArray("forecasts");
        int limit = forecasts.length();
        int sum = 0;

        for (int i = 0; i < forecasts.length(); i++) {
            JSONObject forecast = forecasts
                .getJSONObject(i)
                .getJSONObject("parts")
                .getJSONObject("day");
            sum += forecast.getInt("temp_avg");
        }

        System.out.println("Average temp for next " + limit + " days is " + sum / limit);
    }
}
