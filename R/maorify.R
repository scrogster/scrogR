#' Substitute regular vowels for Maori language equivalents with macrons
#'
#' The Maori language includes vowels with macrons.
#' Including these in R plots often involves typing unicode strings for the relevant macron vowel
#' This function makes this easier, by substituting all instances of the substring "@vowel" for the macronised equivalent in unicode
#'
#' @author Michael Scroggie
#' @param x a string
#' @return a string with unicode macroned vowels substituted for "@vowel" substrings.
#'
#' @export maorify
#' @examples
#' hist(rpois(1000, 5), xlab=maorify("Number of T@u@i per hectare"),
#'		 main=maorify("Density of T@u@i at Whakat@ane"), col="blue")

maorify<-function(x){
	x<-gsub("@a","\u0101", x)   #macron a
	x<-gsub("@e","\u0113", x)   #macron e
	x<-gsub("@i","\u012B", x)   #macron i
	x<-gsub("@o","\u014D", x)   #macron o
	x<-gsub("@u","\u016B", x)   #macron u
	return(x)
}

#Example usage
