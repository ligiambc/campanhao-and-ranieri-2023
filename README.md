# campanhao-and-ranieri-2023

Manuscript title: Influence of forest configuration at multiple spatial scales on sediment yield: a simulation experiment

Journal: Landscape Ecology

Authors: Ligia Maria Barrios Campanhão, Victor Eduardo Lima Ranieri
São Carlos School of Engineering, University of São Paulo (USP), Av. João Dagnone, 1100, 13563-120, São Carlos, SP, Brazil.

Corresponding author at:
Luiz de Queiroz College of Agriculture (ESALQ), University of São Paulo (USP), Av. Pádua Dias, 11, 13418-260, Piracicaba, SP, Brazil. ligiambc@usp.br

Scripts in R and Python employed in the data processing routines described in the Methods section are available. The following R scripts are provided:
* Scripts used to create neutral landscape models without (A) and with (B) a continuous forest strip in the riparian zone
* Scripts used to create landscapes with forest cover allocated according to slope steepness (B)
* Scripts used to create landscapes with forest cover located exclusively alongside the riparian zone (B)
* Script used to create a batch file that contains a list of input layers to be analyzed by Fragstats (C)
* Script used to extract the sediment yield calculated by InVEST from the attribute table of the output shapefile (D)
* Script used to extract the land cover in the riparian zone to calculate landscape metrics at this scale (E)

The following Python scripts are provided:
* Scripts used to automate the calibration of the SDR model (F)
* Script used to automate sediment yield calculation for multiple landscapes (G)

In red are the information that need to be changed by the user. File names can also be changed as per user preference. Note that the code may need to be rewritten due to updates to the R packages and softwares used.
