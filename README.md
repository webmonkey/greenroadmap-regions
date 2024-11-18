# Green Road Map Geographical Regions

Creates a table with geo reference data in it. The table can be used to read these geometries or to query against
so, for example, you can take a known geometry and find out which boundaries it lies within

# Populating data

Use `create-spatial-tables.sql` to create the schema
Run the appropriate `*-sql.php` scripts to generate the MySQL inserts to populate them

# Querying data

You can query it using geometries like this:

```sql
SELECT
    boundary_type,
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
| boundary_type      | name         |
+--------------------+--------------+
| National Landscape | Surrey Hills |
+--------------------+--------------+
```
