library(dplyr)

CD<-read.csv("~/statWR/covid-student-survey.csv")

rt_titles<-CD%>%
  rename(region = Region.of.residence, 
         age = Age.of.Subject, 
         classTime = Time.spent.on.Online.Class, 
         classRatingChr = Rating.of.Online.Class.experience, 
         classMedium = Medium.for.online.class, 
         studyTime = Time.spent.on.self.study,
         fitnessTime = Time.spent.on.fitness,
         sleepTime = Time.spent.on.sleep,
         mediaTime = Time.spent.on.social.media,
         tvTime =Time.spent.on.TV,
         preferredSocial = Prefered.social.media.platform,
         meals = Number.of.meals.per.day,
         weightChange = Change.in.your.weight,
         healthIssue = Health.issue.during.lockdown, 
         destress = Stress.busters,
         moreConnected =
         Do.you.find.yourself.more.connected.with.your.family..close.friends...relatives...,
         missMost = What.you.miss.the.most)%>%
  select(-Time.utilized)

rateLevs = c("Very poor", "Poor", "Average", "Good", "Excellent")
wFactor<-data.frame(rt_titles, classRating=factor(rt_titles$classRatingChr, levels = rateLevs))


