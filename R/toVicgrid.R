#' Transform Spatial* objects among coordinate systems I commonly use
#'
#' @param spobj A Spatial* object.
#' @return A Spatial* object in the specified coordinate system.
#' @export toVicgrid
#' @export toMGA55
#' @export toMGA54
#' @export toWGS84
#' @examples
#' cities_wgs<-SpatialPointsDataFrame(coords=cities[,-1], data=data.frame(city=cities$city), proj4string=CRS("+init=epsg:4326"))
#' citiesVG<-toVicgrid(cities_wgs)
#' plot(citiesVG, xlab="Easting", ylab="Northing", main="Victorian cities in Vicgrid coordinate system")
#' axis(1)
#' axis(2)
#' box()
toVicgrid <- function(spobj) {
  out<-spTransform(spobj, CRS("+init=epsg:3111"))
  return(out)
}

toMGA55 <- function(spobj) {
	out<-spTransform(spobj, CRS("+init=epsg:283555"))
	return(out)
}

toMGA54 <- function(spobj) {
	out<-spTransform(spobj, CRS("+init=epsg:283554"))
	return(out)
}

toWGS84 <- function(spobj) {
	out<-spTransform(spobj, CRS("+init=epsg:4326"))
	return(out)
}

