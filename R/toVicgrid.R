#' Transform Spatial* objects among coordinate systems I commonly use
#'
#' \code{toEPSG} converts a Spatial* object to another coordinate system, based on EPSG code
#' Actual conversion is done by \code{spTransform} from package \code{maptools}
#'
#' This should work for any EPSG code provided at \url{http://spatialreference.org/ref/epsg/}
#'
#' \code{toVicgrid(spobj)} is a convenient shortcut to convert to Vicgrid (epsg 3111)
#'
#' \code{toMGA55(spobj)} is a convenient shortcut to convert to MGA55
#'
#' \code{toMGA54(spobj)} is a convenient shortcut to convert to MGA54
#'
#' \code{toWGS84(spobj)} is a convenient shortcut to convert to WGS84
#'
#' @author Michael Scroggie
#'
#' @param spobj A Spatial* object.
#' @param EPSG  An EPSG code
#' @return A Spatial* object in the specified coordinate system.
#' @aliases toVicgrid toMGA55 toMGA54 toWGS84
#' @export toEPSG
#' @export toVicgrid
#' @export toMGA55
#' @export toMGA54
#' @export toWGS84
#' @examples
#' cities_wgs<-SpatialPointsDataFrame(coords=cities[,-1], data=data.frame(city=cities$city), proj4string=CRS("+init=epsg:4326"))
#' citiesVG<-toEPSG(cities_wgs, 3111)
#' plot(citiesVG, xlab="Easting", ylab="Northing", main="Victorian cities in Vicgrid coordinate system")
#' axis(1)
#' axis(2)
#' box()
toEPSG <-function(spobj, EPSG=3111){
	epsgstring<-paste0("+init=epsg:",EPSG)
	out<-spTransform(spobj, CRS(epsgstring))
	return(out)
}

toVicgrid <- function(spobj) {
	toEPSG(spobj, 3111)
}

toMGA55 <- function(spobj) {
	toEPSG(spobj, 283555)
}

toMGA54 <- function(spobj) {
	toEPSG(spobj, 283554)
}

toWGS84 <- function(spobj) {
	toEPSG(spobj, 4326)
}

