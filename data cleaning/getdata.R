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

file2015 = file2015 %>% filter(FL_DATE >= ymd('2015-11-25') & FL_DATE <= ymd('2015-11-29'))
file2016 = file2016 %>% filter(FL_DATE >= ymd('2016-11-23') & FL_DATE <= ymd('2016-11-27'))
file2017 = file2017 %>% filter(FL_DATE >= ymd('2017-11-22') & FL_DATE <= ymd('2017-11-26'))
file2018 = file2018 %>% filter(FL_DATE >= ymd('2018-11-21') & FL_DATE <= ymd('2018-11-25'))

november = bind_rows(file2015,file2016,file2017,file2018)

november = mutate(thanksgiving,FL_DATE=year(FL_DATE)) %>% rename(year = FL_DATE)

write.csv(thanksgiving,'thanksgiving.csv')
