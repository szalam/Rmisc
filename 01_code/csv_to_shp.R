#This script converts csv file into ESRI shapefile

#library
library(rgdal)
library(sp)
library(raster)

wd = list()
wd$data = 'C:/sarfaraz/Project_cafo_construction_dating/01_data/'
wd$output = 'C:/sarfaraz/Project_cafo_construction_dating/'

#read csv
df = read.csv(paste0(wd$data, 'construction_dates_CA.csv'),header=T)
head(df,1)

class(df) # data.frame
#converting to spatial dataframe
coordinates(df)<-~longitude+latitude

#assing coordinates
cord = '+proj=longlat +datum=WGS84 +no_defs'
crs(df) = crs(cord)

#export shapefile
writeOGR(df, paste0(wd$output, "02_shapefiles"), "cafo_loc_CA", driver = "ESRI Shapefile")

head(df)

