library(dplyr)
library(ggplot2)
library(archdata)
library(readr)
hasanlu_textiles <- read_csv("hasanlu_textiles.csv")
View(hasanlu_textiles)
#Part 2
#a)
sort(table(hasanlu_textiles$Object))
sort(table(hasanlu_textiles$Color))
sort(table(hasanlu_textiles$Condition))

#b)
sort(table(hasanlu_textiles$`Building Location`))

#c)
hasanlu_textiles_BBII <- hasanlu_textiles%>%filter(`Building Location` == "BB II")
hasanlu_textiles_BBIVV <- hasanlu_textiles%>%filter(`Building Location` == "BB IV-V")
sort(table(hasanlu_textiles_BBII$`Room`))
sort(table(hasanlu_textiles_BBIVV$`Room`))

#d)
sort(table(hasanlu_textiles$`Weave Structure`))

#e)

ggplot(hasanlu_textiles, aes(x=`Length (cm)`))+geom_histogram(binwidth = 0.5, colour="black", fill="gray")+
  labs(x = "Length (cm)", y = "Count", 
       title = "Histogram of Length (cm) of Hasanlu Textiles")+
  theme(plot.title = element_text(hjust = 0.5))
ggplot(hasanlu_textiles, aes(x=`Width (cm)`))+geom_histogram(binwidth = 0.5,colour="black", fill="gray") + 
  labs(x = "Width (cm)", y = "Count", title = "Histogram of Width (cm) of Hasanlu Textiles") + 
  theme(plot.title = element_text(hjust = 0.5))
#density distributions
ggplot(hasanlu_textiles, aes(x=`Length (cm)`))+ geom_histogram(aes(y=..density..),
                                                              binwidth=0.5,
                                                              colour="black", fill="white") +
  geom_density(alpha=.2, fill="#FF6666") + labs(title = "Density plot of Length (cm) of Hasanlu Textiles") + theme(plot.title = element_text(hjust = 0.5))
ggplot(hasanlu_textiles, aes(x=`Width (cm)`))+ geom_histogram(aes(y=..density..),
                                                              binwidth=0.5,
                                                              colour="black", fill="white") +
  geom_density(alpha=.2, fill="#FF6666")  + labs(title = "Density plot of Width (cm) of Hasanlu Textiles") + theme(plot.title = element_text(hjust = 0.5))
shapiro.test(hasanlu_textiles$`Length (cm)`)
shapiro.test((hasanlu_textiles$`Width (cm)`))

hasanlu_textiles_weave_structure <- hasanlu_textiles%>%filter(`Weave Structure` == "Balanced plain weave" |`Weave Structure` == "Weft-faced plain weave")
ggplot(hasanlu_textiles_weave_structure, aes(x=`Length (cm)`, fill=`Weave Structure`))+geom_histogram(binwidth = 2.5, position="dodge")+
  labs(x = "Length (cm)", y = "Count", 
       title = "Length (cm) of Hasanlu Textiles, categorized by Weave Structure")+
  theme(plot.title = element_text(hjust = 0.5))
ggplot(hasanlu_textiles_weave_structure, aes(x=`Width (cm)`, fill=`Weave Structure`))+geom_histogram(binwidth = 2.5, position="dodge")+
  labs(x = "Width (cm)", y = "Count", 
       title = "Width (cm) of Hasanlu Textiles, categorized by Weave Structure")+
  theme(plot.title = element_text(hjust = 0.5))

#f)
ggplot(hasanlu_textiles_weave_structure, aes(`Warp diam. (mm)`, `Weft Diam.`, colour=`Weave Structure`)) + geom_point() + 
  labs(x="Warp diameter (mm)", y = "Weft diameter (mm)", 
       title="Warp vs weft diameters (mm) of Hasanlu textiles")+ 
  theme(plot.title = element_text(hjust = 0.5)) + geom_smooth(method=lm)
ggplot(hasanlu_textiles_weave_structure, aes(`Warp count per cm`, `Weft Count per cm.`, colour=`Weave Structure`)) + geom_point() + 
  labs(x="Warp count per cm", y = "Weft count per cm", 
       title="Warp vs weft count per cm in Hasanlu textiles")+ 
  theme(plot.title = element_text(hjust = 0.5)) + geom_smooth(method=lm)
