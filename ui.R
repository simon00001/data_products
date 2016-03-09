# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(shiny)
shinyUI(pageWithSidebar(
  # Application title
  headerPanel("Guess The Number!","Result of your Guess"),
  sidebarPanel(
    wellPanel(
      textInput('datavalues', "Number Guess",""),
      h5('Please press \'Go!\' to see your guessing result, or press \'Analyze!\' which provide analysis on your Number guess.'),
      actionButton("submit","Go"),
      actionButton("hints","Analyze")
    )
  ),
  
  mainPanel(
    h3('Please Guess an integer between 1 and 100 (perhaps your lucky number)'),
    h5('The main objective of this game is to guess an integer between
       1 and 100 (inclusive) and try to match it with the computer\'s
       selected random number. The result of the guess will be analyse if you press the "Analyze" button'),
    h3('Results of Your guess'),
    h4('You had entered'),
    verbatimTextOutput("inputValue"),
    h4('Which is...'),
    verbatimTextOutput("outputValue"),
    h3('Guess Number Analyzer'),
    h5('Your input number will be analyze and the gap of between the numbers will be show in the chart'),
    h6('(press the "Analyze" button to show the analyze graph)'),
    h4('Here is your guess number history :'),
    verbatimTextOutput('datatable'),
    plotOutput("distPlot"),
    h5('Thank you and hope your enjoy for using the simple application')
  )
)
)