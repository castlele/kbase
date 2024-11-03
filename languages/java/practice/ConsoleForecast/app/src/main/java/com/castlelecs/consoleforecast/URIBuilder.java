package com.castlelecs.consoleforecast;

import java.net.URI;

public class URIBuilder {

    private URI uri;

    private URIBuilder(URI uri) {
        this.uri = uri;
    }

    public static URIBuilder fromString(String stringURI) throws Exception {
        return new URIBuilder(new URI(stringURI));
    }

    public URIBuilder query(String key, String value) throws Exception {
        URI oldUri = uri;

        String newQuery = oldUri.getQuery();
        String appendQuery = key + "=" + value;

        if (newQuery == null) {
            newQuery = appendQuery;
        } else {
            newQuery += "&" + appendQuery;
        }

        this.uri = new URI(
            oldUri.getScheme(), oldUri.getAuthority(),
            oldUri.getPath(), newQuery, oldUri.getFragment()
        );

        return this;
    }

    public URI build() {
        return uri;
    }
}
