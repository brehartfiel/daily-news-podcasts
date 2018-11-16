# using the package rvest, you can scrape data from the web.  

library(rvest)

# save the website html
nyt <- read_html('https://www.nytimes.com/column/the-daily')

# I used the selector gadget chrome extension to help me determine the correct text for the css input
# the following scrapes the dates, headlines, and summaries for each of the entries 
nyt_dates <- html_text(html_nodes(nyt,'.dateline'))
nyt_headline <- html_text(html_nodes(nyt, '.headline'))
nyt_summary <- html_text(html_nodes(nyt, '.summary'))


npr <- read_html('https://www.npr.org/podcasts/510318/up-first')
  
npr_dates <- html_text(html_nodes(npr, '.date'))
npr_summary <- html_text(html_nodes(npr, '.teaser'))


# Unfortunately both The Daily and Up First load extra entries using a "load more" button, so
# I can't loop through many pages to get more than the original 20 or 40 that will initially load 

# rvest works best when you can loop through many webpages through the /page/2
# the following website is an example that rvest works very well with
# https://thefinancialdiet.com/page/2/