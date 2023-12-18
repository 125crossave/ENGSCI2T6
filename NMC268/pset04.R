library(dplyr)
library(ggplot2)
library(sf) 
library(tmap) 
require(devtools)
library(maptools) 
library(raster)
library(archdata)
library(spatstat)
library(sp)

#Q1
#a) & b)
mathers<-read.csv("Mathers1981_All.csv")
View(mathers)
dim(mathers)
help(mathers)
str(mathers)

#c & d)
#Create vector data for mapping: define WGS84 CRS and assign this CRS to the dataset
wgs84<-"+proj=longlat +datum=WGS84 +no_defs"
long_lat<-mathers%>%dplyr::select(Longitude, Latitude)
mathers_points<-SpatialPoints(long_lat, proj4string=CRS(wgs84))
mathers_points

#e)
aleppo_shp<-shapefile("AleppoGov.shp")
aleppo_shp
tm_shape(aleppo_shp)+tm_polygons()
river_shp<-shapefile("river.shp")
river_shp
gtopo<-raster("gtopo_me4") #file provided during tutorial to save time by avoiding reprojecting
plot(gtopo, aleppo_shp)

#f)
gtopo_aleppo<-crop(gtopo, aleppo_shp)
plot(gtopo_aleppo)

#g)
tm_shape(gtopo_aleppo)+
  tm_raster(style="cont", title="Elevation (m)", palette=terrain.colors(64))+
  tm_shape(river_shp)+tm_lines()+
  tm_shape(mathers_points)+
  tm_dots(size=0.05)+
  tm_legend(outside=TRUE)+
  tm_layout(main.title="Archaeological site locations within Aleppo governorate",main.title.size=1)+
  tm_compass(position=c("right","bottom"), size=1)+
  tm_scale_bar(position=c("right","bottom"))

#h)
#Early Bronze age points
mathers_eba <- mathers%>%filter(EBA == "Y")
View(mathers_eba)
long_lat_eba<-mathers_eba%>%dplyr::select(Longitude, Latitude)
mathers_eba_points <-SpatialPoints(long_lat_eba, proj4string=CRS(wgs84))
tm_shape(gtopo_aleppo)+
  tm_raster(style="cont", title="Elevation (m)", palette=terrain.colors(64))+
  tm_shape(river_shp)+tm_lines()+
  tm_shape(mathers_eba_points)+
  tm_dots(size=0.05)+
  tm_legend(outside=TRUE)+
  tm_layout(main.title="Archaeological site locations dating to Early Bronze\nAge(~3000-2000 BCE) within Aleppo governorate",main.title.size=1)+
  tm_compass(position=c("right","bottom"), size=1)+
  tm_scale_bar(position=c("right","bottom"))
#Chalcolithic points
mathers_chalco <- mathers%>%filter(Chalco == "Y")
View(mathers_chalco)
long_lat_chalco<-mathers_chalco%>%dplyr::select(Longitude, Latitude)
mathers_chalco_points <-SpatialPoints(long_lat_chalco, proj4string=CRS(wgs84))
tm_shape(gtopo_aleppo)+
  tm_raster(style="cont", title="Elevation (m)", palette=terrain.colors(64))+
  tm_shape(river_shp)+tm_lines()+
  tm_shape(mathers_chalco_points)+
  tm_dots(size=0.05)+
  tm_legend(outside=TRUE)+
  tm_layout(main.title="Archaeological site locations dating to Chalcolithic\nAge (~5000-3000 BCE) within Aleppo governorate",main.title.size=1)+
  tm_compass(position=c("right","bottom"), size=1)+
  tm_scale_bar(position=c("right","bottom"))
#Neolithic points
mathers_neo <- mathers%>%filter(Neolithic == "Y")
View(mathers_neo)
long_lat_neo<-mathers_neo%>%dplyr::select(Longitude, Latitude)
mathers_neo_points <-SpatialPoints(long_lat_neo, proj4string=CRS(wgs84))
tm_shape(gtopo_aleppo)+
  tm_raster(style="cont", title="Elevation (m)", palette=terrain.colors(64))+
  tm_shape(river_shp)+tm_lines()+
  tm_shape(mathers_neo_points)+
  tm_dots(size=0.05)+
  tm_legend(outside=TRUE)+
  tm_layout(main.title="Archaeological site locations dating to Neolithic Age\n(~8500-5000 BCE) within Aleppo governorate",main.title.size=1)+
  tm_compass(position=c("right","bottom"), size=1)+
  tm_scale_bar(position=c("right","bottom"))

#Q2
#a & b)
#Early Bronze Age
sp_points_eba <- SpatialPoints(long_lat_eba)
plot(sp_points_eba)
min(long_lat_eba$Longitude)
max(long_lat_eba$Longitude)
min(long_lat_eba$Latitude)
max(long_lat_eba$Latitude)
window_eba<-owin(xrange=c(min(long_lat_eba$Longitude)-0.1, max(long_lat_eba$Longitude)+0.1),
                 yrange=c(min(long_lat_eba$Latitude)-0.1, max(long_lat_eba$Latitude)+0.1))
points_eba<-ppp(long_lat_eba$Longitude, long_lat_eba$Latitude, window = window_eba)
plot(points_eba)

#c)
Q5_eba <- quadratcount(points_eba, nx = 5, ny = 5)
Q5_eba
plot(Q5_eba)
Q5test_eba<-quadrat.test(points_eba, nx = 5, ny = 5)
Q5test_eba
Q10_eba <- quadratcount(points_eba, nx = 10, ny = 10)
Q10_eba
plot(Q10_eba)
Q10test_eba<-quadrat.test(points_eba, nx = 10, ny = 10)
Q10test_eba
Q20_eba <- quadratcount(points_eba, nx = 20, ny = 20)
Q20_eba
plot(Q20_eba)
Q20test_eba<-quadrat.test(points_eba, nx = 20, ny = 20)
Q20test_eba

#d)
nnd_eba<-nndist(points_eba, k=1)
nnd_eba
mean_nnd_eba<-mean(nnd_eba)
mean_nnd_eba
hist(nnd_eba)
exp_nnd_eba <-0.5*(sqrt(area(window_eba)/points_eba$n))
exp_nnd_eba
NNI_eba<-mean_nnd_eba/exp_nnd_eba
NNI_eba

#e)
#Chalcolithic Age: 
                #Chalco(a)-(b)
sp_points_chalco <- SpatialPoints(long_lat_chalco)
plot(sp_points_chalco)
window_chalco<-owin(xrange=c(min(long_lat_chalco$Longitude)-0.1, max(long_lat_chalco$Longitude)+0.1),
                 yrange=c(min(long_lat_chalco$Latitude)-0.1, max(long_lat_chalco$Latitude)+0.1))
points_chalco<-ppp(long_lat_chalco$Longitude, long_lat_chalco$Latitude, window = window_chalco)
plot(points_chalco)
                #Chalco(c)
Q5_chalco <- quadratcount(points_chalco, nx = 5, ny = 5)
Q5_chalco
plot(Q5_chalco)
Q5test_chalco<-quadrat.test(points_chalco, nx = 5, ny = 5)
Q5test_chalco
Q10_chalco <- quadratcount(points_chalco, nx = 10, ny = 10)
Q10_chalco
plot(Q10_chalco)
Q10test_chalco<-quadrat.test(points_chalco, nx = 10, ny = 10)
Q10test_chalco
Q20_chalco <- quadratcount(points_chalco, nx = 20, ny = 20)
Q20_chalco
plot(Q20_chalco)
Q20test_chalco<-quadrat.test(points_chalco, nx = 20, ny = 20)
Q20test_chalco
                #Chalco(d)
nnd_chalco<-nndist(points_chalco, k=1)
nnd_chalco
mean_nnd_chalco<-mean(nnd_chalco)
mean_nnd_chalco
hist(nnd_chalco)
exp_nnd_chalco <-0.5*(sqrt(area(window_chalco)/points_chalco$n))
exp_nnd_chalco
NNI_chalco<-mean_nnd_chalco/exp_nnd_chalco
NNI_chalco
#f)
#Neolithic age:
                #Neo(a)-(b)
sp_points_neo <- SpatialPoints(long_lat_neo)
plot(sp_points_neo)
window_neo<-owin(xrange=c(min(long_lat_neo$Longitude)-0.1, max(long_lat_neo$Longitude)+0.1),
                    yrange=c(min(long_lat_neo$Latitude)-0.1, max(long_lat_neo$Latitude)+0.1))
points_neo<-ppp(long_lat_neo$Longitude, long_lat_neo$Latitude, window = window_neo)
plot(points_neo)
                #Neo(c)
Q5_neo <- quadratcount(points_neo, nx = 5, ny = 5)
Q5_neo
plot(Q5_neo)
Q5test_neo<-quadrat.test(points_neo, nx = 5, ny = 5)
Q5test_neo
Q10_neo <- quadratcount(points_neo, nx = 10, ny = 10)
Q10_neo
plot(Q10_neo)
Q10test_neo<-quadrat.test(points_neo, nx = 10, ny = 10)
Q10test_neo
Q20_neo <- quadratcount(points_neo, nx = 20, ny = 20)
Q20_neo
plot(Q20_neo)
Q20test_neo<-quadrat.test(points_neo, nx = 20, ny = 20)
Q20test_neo
                #Neo(d)
nnd_neo<-nndist(points_neo, k=1)
nnd_neo
mean_nnd_neo<-mean(nnd_neo)
mean_nnd_neo
hist(nnd_neo)
exp_nnd_neo <-0.5*(sqrt(area(window_neo)/points_neo$n))
exp_nnd_neo
NNI_neo<-mean_nnd_neo/exp_nnd_neo
NNI_neo