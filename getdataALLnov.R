library(dplyr)
library(lubridate)

file2015 = read.csv('2015.csv')
file2016 = read.csv('2016.csv')
file2017 = read.csv('2017.csv')
file2018 = read.csv('2018.csv')

file2015$FL_DATE = ymd(file2015$FL_DATE)
file2016$FL_DATE = ymd(file2016$FL_DATE)
file2017$FL_DATE = ymd(file2017$FL_DATE)
file2018$FL_DATE = ymd(file2018$FL_DATE)

#get thanksgiving holiday and 20 days before thanksgiving holiday
file2015 = file2015 %>% filter(FL_DATE <= ymd('2015-11-29')) %>% filter(FL_DATE >= ymd('2015-11-05')) 
file2016 = file2016 %>% filter(FL_DATE <= ymd('2016-11-27')) %>% filter(FL_DATE >= ymd('2016-11-03'))
file2017 = file2017 %>% filter(FL_DATE <= ymd('2017-11-26')) %>% filter(FL_DATE >= ymd('2017-11-02'))
file2018 = file2018 %>% filter(FL_DATE <= ymd('2018-11-25'))

file2015 = mutate(file2015,period = ifelse(FL_DATE >= ymd('2015-11-25'),'Thanksgiving','Non-Thanksgiving'))
file2016 = mutate(file2016,period = ifelse(FL_DATE >= ymd('2016-11-23'),'Thanksgiving','Non-Thanksgiving'))
file2017 = mutate(file2017,period = ifelse(FL_DATE >= ymd('2017-11-22'),'Thanksgiving','Non-Thanksgiving'))
file2018 = mutate(file2018,period = ifelse(FL_DATE >= ymd('2018-11-21'),'Thanksgiving','Non-Thanksgiving'))

alldates = bind_rows(file2015,file2016,file2017,file2018)

alldates = mutate(alldates,year=year(FL_DATE)) 

write.csv(alldates,'alldates.csv')
