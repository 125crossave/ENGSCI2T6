library(car)
library(dplyr)
library(ggplot2)
library(archdata)
data(Snodgrass)
#Q1
#a)
snodgrass_segments <- Snodgrass%>%filter(Segment == 1| Segment == 2| Segment == 3)
ggplot(snodgrass_segments, aes(Length, Width, colour=Segment)) + geom_point() + 
  labs(x="Length (ft)", y = "Width (ft)", 
       title="Length (ft) vs. Width (ft) measurements of houses \n in different segments of Snodgrass site")+ 
  theme(plot.title = element_text(hjust = 0.5))

#b)
house_location <- Snodgrass%>%filter(Inside=="Inside" | Inside =="Outside")
ggplot(house_location, aes(x=Area, fill=Inside))+ labs(fill="Location relative \n to White Wall") +
  geom_histogram(binwidth=12.5, colour="black",position="dodge") +
  labs(x = "Area of House(ft^2)", y = "Number of Houses", title = "Distribution of Areas of Houses (ft^2) \n Inside & Outside the White Wall")+
  theme(plot.title = element_text(hjust = 0.5))

#c)
inside_white_wall<-Snodgrass%>%filter(Inside=="Inside")
View(inside_white_wall)
shapiro.test(inside_white_wall$Area)
outside_white_wall<-Snodgrass%>%filter(Inside=="Outside")
View(outside_white_wall)
shapiro.test(outside_white_wall$Area)

#d)
leveneTest(Area~Inside, house_location)
t.test(inside_white_wall$Area, outside_white_wall$Area, var.equal=FALSE)

#Q2
#a)
ggplot(house_location, aes(x=Total, fill=Inside))+ labs(fill="Location relative \n to White Wall") +
  geom_histogram(binwidth=2.5, colour="black",position="dodge") +
  labs(x = "Total number of Artifacts in the house", y = "Number of houses", 
       title = "Distribution of Total Number of Artifacts per house \n in houses Inside & Outside the White Wall")+
  theme(plot.title = element_text(hjust = 0.5))
#code for obtaining clearer understanding of distributions of the data
house_outside <-Snodgrass%>%filter(Inside == "Outside")
house_inside <- Snodgrass%>%filter(Inside == "Inside")
ggplot(house_outside, aes(x=Total)) + 
  geom_histogram(aes(y=..density..),
                 binwidth=1,
                 colour="black", fill="white") +
  geom_density(alpha=.2, fill="#FF6666") + 
  labs(x = "Total number of Artifacts in the house", 
       title = "Density Plot of Total Number of Artifacts per house \n for houses Outside the White Wall")
ggplot(house_inside, aes(x=Total)) + 
  geom_histogram(aes(y=..density..),
                 binwidth=1,
                 colour="black", fill="white") +
  geom_density(alpha=.2, fill="#FF6666") +
  labs(x = "Total number of Artifacts in the house", 
       title = "Density Plot of Total Number of Artifacts per house \n for houses Inside the White Wall")

#b)
shapiro.test(inside_white_wall$Total)
shapiro.test(outside_white_wall$Total)

#d)
contingency<-Snodgrass%>%group_by(Inside)%>%
  summarise(TotalNumberOfPoints = sum(Points), TotalNumberOfAbraders = sum(Abraders),
            TotalNumberOfDiscs = sum(Discs), TotalNumberOfEarplugs = sum(Earplugs),
            TotalNumberOfEffigies = sum(Effigies), 
            TotalNumberOfCeramics = sum(Ceramics))%>%select(TotalNumberOfPoints:TotalNumberOfCeramics)
rownames(contingency) = c("Inside", "Outside")
View(contingency)

#e)
chisq.test(contingency)
chisq.test(contingency)$residuals