library(rgdal)
library(rgeos)

#ogrListLayers("boulders/1364_Boulders_Estonian Design Team.dxf")
polygons = readOGR("boulders/1364_Boulders_Estonian Design Team.dxf", "entities", require_geomType="wkbLineString")
polygons = gSimplify(polygons, 0.3)

m = polygons@lines[[1]]@Lines[[1]]@coords
x = m[, 1]
y = m[, 2]

# transform to [-0.5, 0.5]
x = x - min(x)
y = y - min(y)
const = max(x, y)
x = x/max(x)
y = y/max(y)
x = x - 0.5
y = y - 0.5 * diff(range(y))

coords_boulder = data.frame(x=x, y=y)

devtools::use_data(coords_boulder, internal = TRUE, overwrite = TRUE)
