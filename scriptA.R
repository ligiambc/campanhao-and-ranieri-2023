#Install the required packages (if not installed)

install.packages("NLMR")
install.packages("landscapetools")
install.packages("igraph")
install.packages("raster")
install.packages("rgdal")

#Load the required packages (if already installed)

library(NLMR)
library(landscapetools)
library(igraph)
library(raster)
library(rgdal)

###################################
#  NEUTRAL LANDSCAPE MODELS - NM  #
###################################

#Load the mask layer (watershed)

watershed <- raster("C:/folder/watershed_mask.tif")

#Set the values for the arguments ‘percentage’ and ‘roughness’ and the number of landscape replicates

percent <- c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9)
roughness <- c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9)
numberldcp <- 1:100


#Use a "for" loop to generate, manipulate (define extent and projection, classify) and write the landscapes to the hard drive

for (p in percent){
  for (r in roughness){
    for (n in numberldcp){
      yourlandscape <- nlm_mpd(ncol=402, nrow=402, resolution=30, roughness=r, rand_dev=1, rescale=TRUE)
      
      crs(yourlandscape) <- "+proj=utm +zone=23 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs"
      ext <- extent(214816.2110000000102445, 226846.2110000000102445, 7543065.6155000003054738, 7555095.6155000003054738)
      extent(yourlandscape)<-ext
      
      yourlandscape <- mask(yourlandscape, watershed)
      
      yourlandscape <- util_classify(yourlandscape, weighting= c(p, 1-p))
      
      fname <- paste('landscape_p', p, '_r', r, '_', n, '.tif', sep="")
      writeRaster(yourlandscape, filename=fname, format="GTiff", NAflag=-9999)
    }
  }
}
