#Script used to extract the sediment yield from the attribute table of vector files

#Install and load the 'foreign' package, which allows reading the database

install.packages("foreign")
library(foreign)

#Set the working directory
setwd("C:/directory")

##############################
#  NEUTRAL LANDSCAPE MODELS  #
##############################

#Use this code for landscapes generated using neutral landscape models (NM and NMRiparian)

#Create a data frame to store the data

list_sed_export <- data.frame()

#Set the values for the arguments ‘percentage’ and ‘roughness’ and the number of landscape replicates (shapefiles must have this information in their filenames)

percent <- c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9)
roughness <- c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9)
numberldcp <- 1:100

#Use a “for” loop to extract the dbf from the shapefile and add the data to the data frame

for (p in percent){
  for (r in roughness){
    for (n in numberldcp){
      arch <- paste('C:/folder/watershed_results_sdr_landscape_p',p, '_r', r, '_', n, '.dbf', sep="")
      dbf_shape <- read.dbf(arch)
      col_ldcp <- paste('C:/folder/watershed_results_sdr_landscape_p', p, '_r', r, '_', n , '.tif', sep="")
      percentage <- paste(p)
      roughness_val <- paste(r)
      line_ldcp <- cbind(dbf_shape, col_ldcp, percentage, roughness_val)
      list_sed_export <- rbind(line_ldcp, list_sed_export)
    }
  }
}

#Save the table to the hard drive in .csv format

write.csv(list_sed_export, file="sed_export_landscapes.csv", quote=FALSE, row.names=FALSE, col.names=TRUE, na="NA", dec=".")

##########################
#  PRIPARIAN LANDSCAPES  #
##########################

#Create a data frame to store the data

list_sed_export <-data.frame()

#Set the buffer widhts (shapefiles must have this information in their filenames)

widths <- seq(30, 1020, by=30)

#Use a “for” loop to extract the dbf from the shapefile and add the data to the data frame

for (w in widths){
  arch <- paste('C:/folder/watershed_results_sdr_buffer_', w, '.dbf', sep="")
  dbf_shape <- read.dbf(arch)
  col_ldcp <- paste('buffer_', w, sep="")
  wid <- paste(w)
  line_ldcp <- cbind(dbf_shape, col_ldcp, wid)
  list_sed_export <- rbind(line_ldcp, list_sed_export)
}

#Save the table to the hard drive in .csv format

write.csv(list_sed_export, file="sed_export_priparian.csv", quote=FALSE, row.names=FALSE, col.names=TRUE, na="NA", dec=".")

############
#  PSLOPE  #
############

#Create a data frame to store the data

list_sed_export <-data.frame()

#Set the slope ranges (shapefiles must have this information in their filenames)

slopes <- 1:63

#Use a “for” loop to extract the dbf from the shapefile and add the data to the data frame

for (s in slopes){
  arch <- paste('C:/folder/watershed_results_sdr_pslope_', s, '_to_64', '.dbf', sep="")
  dbf_shape <- read.dbf(arch)
  col_ldcp <- paste(s, '_to_64', sep="")
  slope_st <- paste(s)
  line_ldcp <- cbind(dbf_shape, col_ldcp, slope_st)
  list_sed_export <- rbind(line_ldcp, list_sed_export)
}

#Save the table to the hard drive in .csv format

write.csv(list_sed_export, file="sed_export_pslope.csv", quote=FALSE, row.names=FALSE, col.names=TRUE, na="NA", dec=".")
