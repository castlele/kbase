package com.castlelecs.consoleforecast;

import java.io.BufferedReader;
import java.io.FileReader;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class ForecastInteractor {

    private static String FORECAST_API = "https://api.weather.yandex.ru/v2/forecast";
    private static String FORECAST_API_KEY = "X-Yandex-Weather-Key";
    private static String FORECAST_API_KEY_FILENAME = "../.weatherkey.txt";

    private HttpClient client = HttpClient.newHttpClient();

    public void getForecast(double lat, double lon) {
        try {
            HttpRequest request = HttpRequest
                .newBuilder()
                .uri(buildURI())
                .header(FORECAST_API_KEY, readWeatherKey())
                .GET()
                .build();

            HttpResponse<String> response = client.send(
                request,
                HttpResponse.BodyHandlers.ofString()
            );

            System.out.println(response.body());

        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
    }

    private URI buildURI() throws URISyntaxException {
        return new URI(FORECAST_API);
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
}
