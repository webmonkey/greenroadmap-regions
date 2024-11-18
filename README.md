# Green Road Map Geographical Regions

Creates a table with geo reference data in it. The table can be used to read these geometries or to query against
so, for example, you can take a known geometry and find out which boundaries it lies within

# Populating data

 - Use `create-spatial-tables.sql` to create the schema
 - Run the appropriate `*-sql.php` scripts to generate the MySQL inserts to populate them

# Querying data

You can query it using geometries like this:

```sql
SELECT
    type,
    name
FROM
    uk_region_boundaries
WHERE
    ST_Intersects(boundary,
        ST_GeomFromText("LINESTRING (-0.396752 51.238095, -0.398126 51.237397, -0.402374 51.235932, -0.404885 51.23569, -0.409015 51.23516, -0.411204 51.23516)",
        4326)
    )
;
```

This will give a result like:
```
+--------------------+--------------+
| type               | name         |
+--------------------+--------------+
| Parish             | Effingham    |
| Parish             | Wotton       |
| Parish             | Abinger      |
| National Landscape | Surrey Hills |
+--------------------+--------------+
4 rows in set (0.08 sec)
```

# Data Sources

| Name | Location |
| --- | --- |
| Counties/UAs | https://geoportal.statistics.gov.uk/datasets/941217c8d0ea43fabdad50d9b39234f5_0/explore |
| National Parks | https://geoportal.statistics.gov.uk/datasets/a50af95256b34942b391c4f7b29739ff_0/explore |
| National Landscapes | https://naturalengland-defra.opendata.arcgis.com/datasets/6f2ad07d91304ad79cdecd52489d5046_0/explore |
| Parishes | https://geoportal.statistics.gov.uk/datasets/b933971ba4b9463fb7c2645cbae15966_0/explore |

