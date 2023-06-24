#Install the required packages (if not installed)

install.packages("raster")
install.packages("rgdal")

#Load the required packages (if already installed)

library(raster)
library(rgdal)

#Set the working directory
setwd("C:/directory")

#Load the buffer raster file created in GIS

bufferstream <- raster("C:/folder/riparianzone.tif")

#Set the values for the arguments ‘percentage’ and ‘roughness’ and the number of landscape replicates (landscapes must have this information in their filenames)

percent <- c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9)
roughness <- c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9)
numberldcp <- 1:100

#Use a “for” loop to load the NM landscapes, extract the land cover within the riparian zone, and save the landscapes to the hard drive

for (p in percent){
  for (r in roughness){
    for (n in numberldcp){
      
      setwd("C:/folder/")
      fname <- paste('landscape_p', p, '_r', r, '_', n, '.tif', sep="")
      
      landscape <- raster(fname)
      
      landscape <- mask(landscape, bufferstream)
      
      rname <- paste('riparian_nm_p', p, '_r', r, '_', n, '.tif', sep="")
      
      setwd("C:/folder/wheretosave")
      writeRaster(landscape, filename=rname, format="GTiff", NAflag=-9999)
    }
  }
}
