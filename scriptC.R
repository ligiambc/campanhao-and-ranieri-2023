#Script used to generate a batch file for calculating landscape metrics using Fragstats

#Set the working directory
setwd("C:/directory")

#Set the values for the arguments ‘percentage’ and ‘roughness’ and the number of landscape replicates (landscapes must have this information in their filenames)

percent <- c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9)
roughness <- c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9)
numberldcp <- 1:100

#Create a list to store the file paths of your landscapes

list_fragstats <- vector()

#Use a “for” loop to create the file paths and add them to the list

for (p in percent){
  for (r in roughness){
    for (n in numberldcp){
      landscape_path <- print(paste('C:/folder/landscape_p', p, '_r', r, '_', n, '.tif, x, 999, x, x, 1, x, IDF_GeoTIFF', sep=""))
      list_fragstats <- c(list_fragstats, landscape_path)
    }
  }
}

#Save the list as a Fragstats batch file (.fbt)

write.table(list_fragstats, file="yourbatch.fbt", quote=FALSE, row.names=FALSE, col.names=FALSE)
