###

library(caret)

# plan:
# group into class ranking (see which factors might be relevant to class
# satisfaction)

# first model: classMedium, classTime
studyAndClass<-CDFinal%>%
  select(classTime,studyTime,classRating)%>%
  na.omit() 
# need to omit NA's (but leave till the end, so not omitting usable data)

ggplot(studyAndClass, aes(x=classTime,y=studyTime,color=classRating))+
  geom_point(position="jitter")

mod1<-train(classRating~classTime+studyTime, studyAndClass, method="knn")
# don't use: destress (it was categorical and allowed write-ins, so there were 
# a lot of individual unique responses which wouldn't be helpful as predictors)

mod1

timeManagement<-CDFinal%>%
  select(studyTime,sleepTime,mediaTime,tvTime,classRating)%>%
  na.omit()

modTime<-train(classRating~studyTime+sleepTime+mediaTime+tvTime, timeManagement, method="knn")


classAndMed<-CDFinal%>%
  select(classTime,classMedium,classRating)%>%
  na.omit()

modClass<-train(classRating~classTime+classMedium, classAndMed, method="knn")


homeLife<-CDFinal%>%
  select(age,meals,moreConnected,missMost,classRating)%>%
  na.omit()

modHome<-train(classRating~age+meals+moreConnected+missMost, 
            homeLife, method="knn")

comboSet<-CDFinal%>%
  select(classTime,classMedium,age,meals,moreConnected,missMost,classRating)%>%
  na.omit()

modCombo<-train(classRating~classTime+classMedium+age+meals+moreConnected+missMost, 
                comboSet, method="knn")


s1<-data.frame(classTime=mean(CDFinal$classTime),
               classMedium="Laptop/Desktop",
               age=mean(CDFinal$age),
               meals=mean(CDFinal$meals),
               moreConnected="YES",
               missMost="School/college")

predict(modClass,s1)
predict(modHome,s1)
predict(modCombo,s1)

s2<-data.frame(classTime=mean(CDFinal$classTime),
               classMedium="Laptop/Desktop",
               age=mean(CDFinal$age),
               meals=mean(CDFinal$meals),
               moreConnected="NO",
               missMost="Friends , relatives")

predict(modClass,s2)
predict(modHome,s2)
predict(modCombo,s2)

quantile(CDFinal$classTime, probs = 0.25)

s3<-data.frame(classTime=2,
               classMedium="Laptop/Desktop",
               age=mean(CDFinal$age),
               meals=mean(CDFinal$meals),
               moreConnected="NO",
               missMost="Friends , relatives")

predict(modClass,s3)
predict(modHome,s3)
predict(modCombo,s3)

s4<-data.frame(classTime=2,
               classMedium="Laptop/Desktop",
               age=mean(CDFinal$age),
               meals=mean(CDFinal$meals),
               moreConnected="YES",
               missMost="Friends , relatives")

predict(modClass,s4)
predict(modHome,s4)
predict(modCombo,s4)
