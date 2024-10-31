package com.castlelecs.consoleforecast;

public class App {

    public static void main(String[] args) {
        // Moscow coords
        double lat = 55.7558;
        double lon = 37.6173;
        ForecastInteractor interactor = new ForecastInteractor();

        interactor.getForecast(lat, lon);
    }
}
