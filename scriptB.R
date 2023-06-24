#Install the required packages (if not installed)

install.packages("raster")
install.packages("rgdal")

#Load the required packages (if already installed)

library(raster)
library(rgdal)

#Set the working directory
setwd("C:/directory")

########################################
#  FOREST / RIPARIAN ZONE - PRIPARIAN  #
########################################

#Load the stream network raster file

stream <- raster("C:/folder/only_stream.tif")

#Load the mask layer (watershed)

watershed <- raster("C:/folder/watershed.tif")

#Set the initial buffer width

wid <- 30

#Use a “while” loop to generate, manipulate and write the landscapes to the hard drive

while (wid < 1030){
  riparian <- buffer(stream, width = wid)
  riparian <- merge(riparian, watershed)
  riparian <- mask(riparian, watershed)
  
  fname <- paste('buffer_', wid, '.tif', sep="")
  writeRaster(riparian, filename = fname, format="GTiff", NAflag=-9999)
  
  wid <- wid + 30
}

#######################################
#  FOREST / SLOPE STEEPNESS - PSLOPE  #
#######################################

#Load the slope (%) raster file of your study area

slope <- raster("C:/folder/slope_studyarea.tif")

#Set the initial slope

slope_start <- 63

#Use a “while” loop to generate, manipulate, and write the landscapes to the hard drive

while (slope_start > 0){
  m <- c(slope_start, 64, 1    , 0, slope_start, 2)
  mrec <- matrix(m, ncol= 3, byrow=TRUE)
  
  slopeland <- reclassify(slope, mrec)
  
  fname <- paste('pslope_', slope_start, '_to_64', '.tif', sep="")
  writeRaster(slopeland, filename = fname, format="GTiff", NAflag=-9999)
  
  slope_start <- slope_start - 1
}

############################################################
#  NEUTRAL LANDSCAPE MODELS + RIPARIAN STRIP - NMRIPARIAN  #
############################################################

#Load the stream network raster file

stream <- raster("C:/folder/only_stream.tif")

#Load the mask layer (watershed)

watershed <- raster("C:/folder/watershed.tif")

#Create a buffer alongside the stream

rbuffer <- buffer(stream, width = 30)

#Set the values for the arguments ‘percentage’ and ‘roughness’ and the number of landscape replicates

percent <- c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9)
roughness <- c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9)
numberldcp <- 1:100

#Use a "for" loop to generate, manipulate (define extent and projection, classify), and save the landscapes to the hard drive

for (p in percent){
  for (r in roughness){
    for (n in numberldcp){
      yourlandscape <- nlm_mpd(ncol=402, nrow=402, resolution=30, roughness=r, rand_dev=1, rescale=TRUE)
      
      crs(yourlandscape) <- "+proj=utm +zone=23 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs"
      ext <- extent(214816.2110000000102445, 226846.2110000000102445, 7543065.6155000003054738, 7555095.6155000003054738)
      extent(yourlandscape) <- ext
      
      yourlandscape <- mask(yourlandscape, watershed)
      
      yourlandscape <- util_classify(yourlandscape, weighting= c(p, 1-p))
      
      yourlandscape <- merge(rbuffer, yourlandscape)
      
      fname <- paste('landscape2_p', p, '_r', r, '_', n, '.tif', sep="")
      writeRaster(yourlandscape, filename=fname, format="GTiff", NAflag=-9999)
    }
  }
}
