# I copied the text of the website and pasted it into an excel workbook.
# The text output for both websites needs to be cleaned and variables need to be created. 

library(lubridate)
library(readxl)

# Importing the pasted website text
npr_text <- read_excel("website_text.xlsx", sheet = "npr", col_names = "webtext")
nyt_text <- read_excel("website_text.xlsx", sheet = "nyt", col_names = "webtext")

# Starting with Up First! cause it's first. 
npr_working = npr_text[29:2287,] # getting rid of the header, navigation, footer info

# Using grep to search for "download" because the data follows this exact pattern:
#  Date, Description, Length, Download link

#Thursday, November 15th, 2018
#Search teams in California have a grim duty as the death toll in the Camp Fire rises.....
#LISTEN· 13:36QUEUE
#Download

Date = npr_working[grep("Download", npr_working$webtext)-4,]
Date = ymd(as.Date(as.numeric(Date$webtext), origin = "1899-12-30"))


Headline = npr_working[grep("Download", npr_working$webtext)-3,]
Description = npr_working[grep("Download", npr_working$webtext)-2,]



npr = cbind(Date, Headline, Description)
colnames(npr) = c("Date", "Headline", "Description")


nyt_working = nyt_text[10:1118,] # getting rid of the header, navigation, footer info

# NYT follows this format:
# Headline, Description, Date       


# 1 A Conversation With a Freshman Democrat                                                          
# 2 We spoke with Abigail Spanberger, a recently elected congresswoman from Virginia, about~
# 3 Nov. 15, 2018  


# there is no convenient repeatable section, so going by sequence/pattern
nyt_headline = nyt_working[seq(1, 270,3),] # this only works for the first 270 rows (7/12/2018)
nyt_headline = rbind(nyt_headline, nyt_working[seq(271, 374,4),])
nyt_headline = rbind(nyt_headline, nyt_working[374,])
nyt_headline = rbind(nyt_headline, nyt_working[seq(378, nrow(nyt_working),4),])

nyt_summary = nyt_working[seq(2, 272,3),]
nyt_summary = rbind(nyt_summary, nyt_working[seq(276, 374,4),])
nyt_summary = rbind(nyt_summary, nyt_working[375,])
nyt_summary = rbind(nyt_summary, nyt_working[seq(379, nrow(nyt_working),4),])

nyt_date = nyt_working[seq(3, 272,3),]
nyt_date = rbind(nyt_date, nyt_working[seq(274, 372,4),])
nyt_date = rbind(nyt_date, nyt_working[373,])
nyt_date = rbind(nyt_date, nyt_working[seq(377, nrow(nyt_working),4),])

#about 100 rows came in as the Excel numeric 5 digit date, so this fixes that issue
datefix = ymd(as.Date(as.numeric(nyt_date$webtext[78:183]), origin = "1899-12-30"))
nyt_date = mdy(nyt_date$webtext)
nyt_date[78:183] = datefix

nyt = cbind(nyt_date, nyt_headline, nyt_summary)
colnames(nyt) = c("Date", "Headline", "Description")



