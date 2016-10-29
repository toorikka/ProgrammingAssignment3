rankhospital <- function(state, outcome, num="best"){
      ## Read outcome data, change "Not Available" to NA
  data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available") 
  
      ## Check that outcome and state are valid
  if(!any(outcome == "heart attack" | outcome == "heart failure" | outcome == "pneumonia")){
    stop("invalid outcome") } 
  
  if(!any(data$State == state)){  stop("invalid state") 
    
      ## Return hospital name in that state with the given rank
      ## 30-day death rate
  } else if(outcome == "heart attack"){ 
        ##rateOneState to contain Hosp.Name and outcome death rate for a given state only         
      rateOneState <- subset(data, State == state, select= c(2, 11))
    
        ##Handling ties: order by death rate (min first), then by hospital (alph), remove NAs
      ordered <- rateOneState[ order( rateOneState[, 2], rateOneState[, 1], na.last = NA ), ] 
      rows <- nrow(ordered)
    
          ##check the ranking value given in 'num'
        if(num == "best"){
          best_hospital<-as.character(ordered[1, 1]) ##return first row
          best_hospital
        
        }else if (num == "worst"){
          best_hospital<-as.character(ordered[rows, 1]) ##return last row
          best_hospital
        
        }else if(num > rows){ return(NA) ##num bigger than nrows

        }else  {
          best_hospital<-as.character(ordered[num, 1]) ##return rank nbr given in function call
          best_hospital
        }
    ## end heart attack handling
  
  } else if(outcome == "heart failure"){ 
      rateOneState <- subset(data, State == state, select= c(2, 17))
      ordered <- rateOneState[ order( rateOneState[, 2], rateOneState[, 1], na.last = NA ), ] #Sortby HF rate, then by hospital, remove NAs
      rows <- nrow(ordered)
  
        if(num == "best"){
          best_hospital<-as.character(ordered[1, 1])
          best_hospital
    
      } else if (num == "worst"){
          best_hospital<-as.character(ordered[rows, 1])
          best_hospital
    
      } else if(num > rows){ return(NA)
    
      } else  {
          best_hospital<-as.character(ordered[num, 1])
          best_hospital
        }
    ## end heart failure handling
  
  } else if(outcome == "pneumonia"){ 
      rateOneState <- subset(data, State == state, select= c(2, 23))
      ordered <- rateOneState[ order( rateOneState[, 2], rateOneState[, 1], na.last = NA ), ] #Sortby PN rate, then by hospital, remove NAs
      rows <- nrow(ordered)
  
        if(num == "best"){
          best_hospital<-as.character(ordered[1, 1])
          best_hospital
    
      } else if (num == "worst"){
          best_hospital<-as.character(ordered[rows, 1])
          best_hospital
    
      } else if(num > rows){ return(NA)
    
      } else  {
          best_hospital<-as.character(ordered[num, 1])
          best_hospital
        }
    } ## end pneumonia handling
}



## testing outcome:
## > rankhospital("TX", "heart failure", 4)
## [1] "DETAR HOSPITAL NAVARRO"
## > rankhospital("MD", "heart attack", "worst")
## [1] "HARFORD MEMORIAL HOSPITAL"
## > rankhospital("TX", "heart failure", "best")
## [1] "FORT DUNCAN MEDICAL CENTER"

