#Q1
library(dplyr)
library(archdata)
data(Snodgrass)

#Q2
#The number of observations and variables in Snodgrass
#can be seen in the Environment section of RStudio.

#Q3, Q4
help(Snodgrass)
str(Snodgrass)
View(Snodgrass)

#Q5
#Group by Segment
SegmentAreaInfo<-Snodgrass%>%
  group_by(Segment)%>%
  summarise(MeanArea = mean(Area), MedianArea = median(Area))
View(SegmentAreaInfo)#Q6
#Group by Inside or Outside White Wall
WhiteWallAreaInfo<-Snodgrass%>%
  group_by(Inside)%>%
  summarise(MeanArea = mean(Area), MedianArea = median(Area))
View(WhiteWallAreaInfo)
#Q6
SegmentArtifactInfo <- Snodgrass%>%
  group_by(Segment)%>%
  summarise(TotalArtifacts = sum(Total), MeanArtifacts = mean(Total))
View(SegmentArtifactInfo)
WhiteWallArtifactInfo <- Snodgrass%>%
  group_by(Inside)%>%
  summarise(TotalArtifacts = sum(Total), MeanArtifacts = mean(Total))
View(WhiteWallArtifactInfo)
#Q7
SegmentArtifactDiversityInfo <- Snodgrass%>%
  group_by(Segment)%>%
  summarise(MeanNumberOfArtifactTypes = mean(Types))
View(SegmentDiversityInfo)
WhiteWallArtifactDiversityInfo <- Snodgrass %>%
  group_by(Inside)%>%
  summarise(MeanNumberOfArtifactTypes = mean(Types))
View(WhiteWallArtifactDiversityInfo)
#Q8
ArtifactFrequency <- Snodgrass%>%
  group_by(Segment)%>%
  summarise(TotalNumberOfPoints = sum(Points), MeanNumberOfPoints = mean(Points),
            TotalNumberOfAbraders = sum(Abraders), MeanNumberOfAbraders = mean(Abraders),
            TotalNumberOfDiscs = sum(Discs), MeanNumberOfDiscs = mean(Discs),
            TotalNumberOfEarplugs = sum(Earplugs), MeanNumberOfEarplugs = mean(Earplugs),
            TotalNumberOfEffigies = sum(Effigies), MeanNumberOfEffigies = mean(Effigies),
            TotalNumberOfCeramics = sum(Ceramics), MeanNumberOfCeramics = mean(Ceramics),)
View(ArtifactFrequency)
