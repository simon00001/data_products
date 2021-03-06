---
title       : Developing Data Products - Course Project 
subtitle    : Guess the Number Game (with Analyzer)
author      : Simon Kong (6 March 2016)
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Welcome to Guess the Number Game - Summary

Guess The Number is a number guessing game application.

The main objective of this game is to guess an integer between 1 and 100 and try to match it with the computer's random selection number using random function. Below shows how the application works:

  - You can try by input your lucky number
  - Once entered, please button "GO"
  - Server code will process the number entered
  - A random number is generated between 1 and 100
  - The random number is compare against the user entered number
  - The history of the Guess number and result of the Guess will provide hints if the user number is lower or higher than the computer random number.
  - You may click on "Analyze" button to view Guess Number Analyzer in Graphical mode.


--- .class #1
  

## UI Code
here is some of the sample code of R to create an input for the Number Guess with additional button for display Analyze Graph:

```r
#shinyUI(pageWithSidebar(
  ## Application title
  #headerPanel("Guess The Number!","Result of your Guess"),
  #sidebarPanel(
  #  wellPanel(
  #    textInput('datavalues', "Number Guess",""),
  #    h5('Please press \'Go!\' to see your guessing result, or press \'Analyze!\' which provide analysis on your Number guess.'),
  #    actionButton("submit","Go"),
  #    actionButton("hints","Analyze")  )
  #)
  #)  
```



--- .class #2

## Server Code

Code for reparing the ploting of the histogram to show analysics of the Number Guess :

```r
library(ggplot2)
#sample data 
xlist <- c(1,2,3,4,5)
ylist <- c(-30,20,-10,10,0)
dtf <- data.frame(xlist,ylist)  
ggplot(dtf, aes(xlist, ylist)) + geom_bar(stat = "identity", aes(fill=xlist)) + labs(x="No of Tries", y="Gap between Number Guess", title="Number Guess Analyzer")+ geom_text(aes(label = ylist)) + theme_bw()
```

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png)
***

--- .class #3

## How to Play with Guess Number Analyzer
Test it out, here is the link :

 [Click here to play](https://simonk.shinyapps.io/guess/)

Beat the Machine with your lucky number. 

If you need some help, press the "Analyze" button to set the Analyze Graph on which show you the gap between the Number Guess and the Computer selected number.

Enjoy!

