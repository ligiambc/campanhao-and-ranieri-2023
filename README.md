# campanhao-and-ranieri-2023

Manuscript title: Influence of forest proportion and configuration at the watershed and riparian zone scales on sediment yield: a simulation experiment

Journal: Landscape Ecology

Authors: Ligia Maria Barrios Campanhão*, Victor Eduardo Lima Ranieri
São Carlos School of Engineering, University of São Paulo (USP), Av. João Dagnone, 1100, São Carlos, SP, 13563-120, Brazil.

*Corresponding author at:
Luiz de Queiroz College of Agriculture (ESALQ), University of São Paulo (USP), Av. Pádua Dias, 11, Piracicaba, SP, 13418-260, Brazil. ligiambc@usp.br

Scripts in R and Python employed in the data processing routines described in the Methods section are available. The following R scripts are provided:
* Script used to create neutral landscape models without (A) and with (B) a continuous forest strip in the riparian zone
* Script used to create landscapes with forest cover allocated according to slope steepness (B)
* Script used to create landscapes with forest cover located exclusively alongside the riparian zone (B)
* Script used to create a batch file that contains a list of input layers to be analyzed by Fragstats (C)
* Script used to extract the sediment yield calculated by InVEST from the attribute table of the output shapefile (D)
* Script used to extract the land cover in the riparian zone to calculate landscape metrics at this scale (E)

The following Python scripts are provided:
* Scripts used to automate the calibration of the SDR model (F)
* Script used to automate sediment yield calculation for multiple landscapes (G)

Please note that the code may need to be rewritten due to updates to the R packages and software used.
