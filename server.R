library(shiny)
library(ggplot2)

#global variable
xlist <- NULL
ylist <- NULL

No_of_Try <-NULL
Number_Guess <-NULL

# function to check the number input against the number select by computer
# return the string of comments to provide hints to user before enter the next number

numberGuessed <- function(guess, number) {
  returnValue <- "You had not entered anything yet."
  if (guess > 100) {
    returnValue <- 'Above 100.\nPlease make a selection between 1 and 100.'
  }
  else if (guess < 1) {
    returnValue <- 'Below 1.\nPlease make a selection between 1 and 100.'
  }
  else if (guess > number) {
    returnValue <- 'Higher than the number.'
  }
  else if (guess < number) {
    returnValue <- 'Lower than the number.'
  }
  else if (guess == number) {
    returnValue <- 'Correct! Finally you get the correct right number. Congratulation'
  }
  returnValue
}

shinyServer(function(input,output,session){
  #the computer guesses an integer between 1 & 100
  number <- floor(runif(1,1,101))
  xlist <<- NULL
  ylist <<- NULL
  
  No_of_Try <<-NULL
  Number_Guess <<-NULL
  #auto evaluate the input number against the computer selected number
    data1= reactive({
    if(input$submit!=0){
      isolate({
        # update the xlist and store the gap between the new input value and the number select by computer
       xlist[length(xlist)+1] <<- length(xlist)+1
        a <- as.numeric(input$datavalues)
        ylist[length(ylist)+1] <<- a - number
        Number_Guess[length(Number_Guess)+1] <<- a
       data.frame(paste(input$datavalues))
      })
    }
  })
  
# Preparing and passing the input value and display in the webpages with comments  
  output$inputValue <- renderPrint({as.numeric(input$datavalues)})
  output$outputValue <- renderText({
    if (input$submit == 0) "You have not guessed a number yet"
    else if (input$submit >= 1) numberGuessed(as.numeric(input$datavalues), number)
  })
 
    
  output$datatable<-renderPrint(function(){
    if(!is.null(data1())){
      No_of_Try <- xlist
      d <- data.frame(No_of_Try,Number_Guess)
     # d<-data1()
      print(d)
    }
  })
  
  # Preparing the ploting of the histogram to show analysics
  output$distPlot <- renderPlot({
    if(!is.null(data1()) & (input$hints!=0)){
    dtf <- data.frame(xlist,ylist)

    # draw the histogram with Guess Game Analysics
    if (length(xlist) >= 1){
        ggplot(dtf, aes(xlist, ylist)) + geom_bar(stat = "identity", aes(fill=xlist)) + labs(x="No of Tries", y="Gap between Number Guess", title="Number Guess Analyzer")+ geom_text(aes(label = ylist)) +  theme_bw() 
     }
   }
  })
})