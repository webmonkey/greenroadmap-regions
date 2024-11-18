<?php

require __DIR__ . '/vendor/autoload.php';

$json = file_get_contents('National_Parks_December_2022_Boundaries_GB_BUC_69747612890003001.geojson');

$parsed = json_decode($json);

// each feature is one AONB
foreach ($parsed->features as $feature) {
    $name = $feature->properties->NPARK22NM;
    print("-- $name". PHP_EOL);

    // take the decoded JSON for this AONB and then convert it to JSON > GeoPHP Object > WKT
    printf('INSERT INTO uk_region_boundaries (type, name, boundary) VALUES("National Park", "%s", ST_GeomFromText("%s", 4326));'. PHP_EOL,
        $name,
        geoPHP::load(json_encode($feature),'json')->out("wkt")
    );
}

