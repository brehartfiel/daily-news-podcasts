# I copied the text of the website and pasted it into an excel workbook.
# The text output for both websites needs to be cleaned and variables need to be created. 


# Importing the pasted website text
library(readxl)
npr_text <- read_excel("website_text.xlsx", sheet = "npr", col_names = "webtext")
nyt_text <- read_excel("website_text.xlsx", sheet = "nyt", col_names = "webtext")

# Starting with Up First! cause it's first. 
npr_working = npr_text[29:2287,] # getting rid of the header, navigation, footer info


# each episode info for NPR has 7 lines of information 
# 1 Thursday, November 15th, 2018                                                                   
# 2 43419                                                                                           
# 3 Thursday, November 15th, 2018                                                                   
# 4 Search teams in California have a grim duty as the death toll in the Camp Fire rises. In Florid~
# 5 LISTEN· 13:36QUEUE                                                                              
# 6 Download                                                                                        
# 7 Embed

# first entry is headline
# second entry is a date, but excel converted it to a numeric date
# fourth entry is summary


npr_headline = npr_working[seq(1, 65,7),]
npr_headline = rbind(npr_headline, npr_working[seq(88, 359,7),])
npr_headline = rbind(npr_headline, npr_working[seq(365, 391,7),])
npr_headline = rbind(npr_headline, npr_working[392,])
npr_headline = rbind(npr_headline, npr_working[seq(398, 571,7),])
npr_headline = rbind(npr_headline, npr_working[seq(572, 829,7),])
npr_headline = rbind(npr_headline, npr_working[seq(830, 877,7),])
npr_headline = rbind(npr_headline, npr_working[seq(878, 1065,7),])
npr_headline = rbind(npr_headline, npr_working[c(1066,1073),])
npr_headline = rbind(npr_headline, npr_working[seq(1079, 1805,7),])
npr_headline = rbind(npr_headline, npr_working[seq(1806, 1916,7),])
npr_headline = rbind(npr_headline, npr_working[seq(1917, nrow(npr_working),7),])



npr_date = npr_working[seq(2, 65,7),]
npr_date = rbind(npr_date, npr_working[seq(87, 359,7),])
npr_date = rbind(npr_date, npr_working[seq(366, 391,7),])
npr_date = rbind(npr_date, npr_working[393,])
npr_date = rbind(npr_date, npr_working[seq(399, 571,7),])
npr_date = rbind(npr_date, npr_working[seq(573, 829,7),])
npr_date = rbind(npr_date, npr_working[seq(831, 877,7),])
npr_date = rbind(npr_date, npr_working[seq(879, 1065,7),])
npr_date = rbind(npr_date, npr_working[c(1067,1074),])
npr_date = rbind(npr_date, npr_working[seq(1080, 1805,7),])
npr_date = rbind(npr_date, npr_working[seq(1807, 1916,7),])
npr_date = rbind(npr_date, npr_working[seq(1918, nrow(npr_working),7),])
library(lubridate)
npr_date = as.numeric(unlist(npr_date))
npr_date = as.Date(npr_date, origin = "1899-12-30")


npr_summary = npr_working[seq(4, 65,7),]
npr_summary = rbind(npr_summary, npr_working[seq(89, 359,7),])
npr_summary = rbind(npr_summary, npr_working[seq(368, 391,7),])
npr_summary = rbind(npr_summary, npr_working[395,])
npr_summary = rbind(npr_summary, npr_working[seq(401, 571,7),])
npr_summary = rbind(npr_summary, npr_working[seq(575, 829,7),])
npr_summary = rbind(npr_summary, npr_working[seq(833, 877,7),])
npr_summary = rbind(npr_summary, npr_working[seq(881, 1065,7),])
npr_summary = rbind(npr_summary, npr_working[c(1069,1076),])
npr_summary = rbind(npr_summary, npr_working[seq(1082, 1805,7),])
npr_summary = rbind(npr_summary, npr_working[seq(1809, 1916,7),])
npr_summary = rbind(npr_summary, npr_working[seq(1920, nrow(npr_working),7),])



nyt_working = nyt_text[10:1118,] # getting rid of the header, navigation, footer info


# 1 A Conversation With a Freshman Democrat                                                          
# 2 We spoke with Abigail Spanberger, a recently elected congresswoman from Virginia, about her firs~
# 3 Nov. 15, 2018                                                                                    
 
# first entry is title
# second entry is summary
# third entry is date

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

