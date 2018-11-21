# Daily News Podcasts

I listen to two daily news podcasts:
* [The Daily](https://www.nytimes.com/column/the-daily) from the New York Times
* [Up First](https://www.npr.org/podcasts/510318/up-first) from NPR

If I listen to both podcasts every day, how often am I hearing the same story from two different sources?  Can I create a model to predict if I will hear a duplicate story that day? 

## Data

The data was pulled from each podcast's website ([The Daily](https://www.nytimes.com/column/the-daily) and [Up First](https://www.npr.org/podcasts/510318/up-first)).  Three pieces of data will be gathered for each episode: date, headline, and summary. 

I will have to go through and read each podcast's description to determine if the same story is covered twice.

## Rough plan:
1.  Gather episode data for both podcasts

      a.  Using `rvest` to scrape data from website
  
      b.  Copying the text of the entire webpage
  
2.  Clean data

     a. Format date, standardize headlines

3.  Label episodes with same story match

4.  Create preliminary descriptive statistics for each podcast

    a.  Word frequency, stemming, sentence count, ect. 
    
    b.  Remove stop words (common words like a, an, the, and, etc.)
    
5.  Create similarity measures

    a.  Create statistics that compare how similar the words and phrases used in each summary are to each other on the same day.  

5.  Reduce dimensions 

    a.  Remove or combine variables are sparse (near zero variance)
    
6.  Creating the model

    a.  Use cross validation to determine which method is best (logistic regression, tree based methods, QDA, SVM, etc.)
    
    b.  Fit best model and determine best easily interpretable model
    
    d.  Finalize model
    
7.  Interpret and visualize model
