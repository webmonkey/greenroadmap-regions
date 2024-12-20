DROP TABLE IF EXISTS uk_region_boundaries;
CREATE TABLE uk_region_boundaries (
    type ENUM("County", "National Park", "National Landscape","Parish"),
    name VARCHAR(100) NOT NULL,
    boundary GEOMETRY NOT NULL SRID 4326,

    SPATIAL INDEX(boundary)
);

DROP TABLE IF EXISTS lookup_geometries;
CREATE TABLE lookup_geometries (
    name VARCHAR(100) NOT NULL,
    geometry GEOMETRY NOT NULL SRID 4326
);

INSERT INTO lookup_geometries (name, geometry) VALUES
    ("Newlands Corner",             ST_GeomFromText("POINT(-0.5064713 51.2329694)",4326)),
    ("Buckingham Palace",           ST_GeomFromText("POINT(-0.1419329173761422 51.50133722966322)",4326)),
    ("Sevenoaks Wildlife Reserve",  ST_GeomFromText("POINT(0.18080 51.29719)",4326)),
    ("Bramley",                     ST_GeomFromText("POINT(-0.55644 51.19387)",4326)),
    ("Drove Road",                  ST_GeomFromText("LINESTRING (-0.396752 51.238095, -0.398126 51.237397, -0.402374 51.235932, -0.404885 51.23569, -0.409015 51.23516, -0.411204 51.23516)", 4326)),
    ("Bromley BY283",               ST_GeomFromText("LINESTRING (0.05181 51.302729, 0.052325 51.302709, 0.052786 51.302602, 0.055071 51.302669, 0.055554 51.302474, 0.056208 51.302387, 0.060747 51.303071, 0.060425 51.303816, 0.0655 51.304688)", 4326)),
    ("Vigo Byway",                  ST_GeomFromText("LINESTRING (0.364072 51.337422, 0.36551 51.336765, 0.366218 51.335197, 0.366433 51.334151, 0.366776 51.332475, 0.366561 51.331631, 0.366497 51.331, 0.365961 51.329298, 0.366218 51.328359, 0.367548 51.327662, 0.369158 51.327219, 0.370381 51.326924, 0.370531 51.32666)", 4326))
;

