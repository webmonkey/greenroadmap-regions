<?php

require __DIR__ . '/vendor/autoload.php';

$json = file_get_contents('Parishes_May_2023_Boundaries_EW_BFC_7336219346086940152.geojson');

$parsed = json_decode($json);

// each feature is one AONB
foreach ($parsed->features as $feature) {
    $name = $feature->properties->PAR23NM;
    print("-- $name". PHP_EOL);

    // take the decoded JSON for this AONB and then convert it to JSON > GeoPHP Object > WKT
    printf('INSERT INTO uk_region_boundaries (boundary_type, name, boundary) VALUES("Parish", "%s", ST_GeomFromText("%s", 4326));'. PHP_EOL,
        $name,
        geoPHP::load(json_encode($feature),'json')->out("wkt")
    );
}

