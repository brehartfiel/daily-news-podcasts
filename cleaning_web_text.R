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


npr_headline = na.omit(npr_working[seq(1, nrow(npr_working),7),])
npr_date = na.omit(npr_working[seq(2, nrow(npr_working),7),])
library(lubridate)
npr_date = as_date(npr_date[,1])




nyt_working = nyt_text[10:1118,] # getting rid of the header, navigation, footer info

nyt_headline = nyt_working[seq(1, 270,3),] # this only works for the first 270 rows (7/12/2018)
nyt_headline = rbind(nyt_headline, nyt_working[seq(271, 374,4),])
nyt_headline = rbind(nyt_headline, nyt_working[374,])
nyt_headline = rbind(nyt_headline, nyt_working[seq(378, nrow(nyt_working),4),])

nyt_headline = rbind(nyt_headline, nyt_working[seq(271, nrow(nyt_working),4),])

