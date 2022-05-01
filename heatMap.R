

sleepMap<-CDFinal%>%
  select(classMedium,classRating,sleepTime,moreConnected)%>%
  na.omit()

ggplot(sleepMap, aes(x=moreConnected, y=classRating, fill=sleepTime))+
  geom_tile(color = "white")+
  theme(axis.text.x=element_text(angle=90))+
  labs(x="More Connected?",y="Class Rating", 
         title="Sleep by Class Rating and Connection")+
  scale_fill_distiller(palette = "Greens", direction = 0)

eRating<-sleepMap%>%
  filter((classRating=="Excellent")&(moreConnected=="NO"))

summary(eRating$sleepTime) # actually pretty normal median sleep time;
# just few observations and a low minimum (5hrs)