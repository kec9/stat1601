#source("~/statWR/cv_clean.R")

library(ggplot2)
library(ggwordcloud)
library(RColorBrewer)

stress<-CDFinal%>%
  group_by(destress)%>%
  summarize(count=n())%>%
  arrange(desc(count))%>%
  head(10)

#unique(stress$destress)

ggplot(stress,aes(label=destress, size = count, color=destress))+
  geom_text_wordcloud_area()+
  scale_color_brewer(palette = "PRGn")+
  theme_minimal()
  

