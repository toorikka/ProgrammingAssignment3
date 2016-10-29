best <- function(state, outcome) {
            ## Read outcome data, hange also "Not Available" string to NA
  data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available") 
  
            ## Check that outcome and state are valid
    if(!any(outcome == "heart attack" | outcome == "heart failure" | outcome == "pneumonia")){
      stop("invalid outcome") } 

    if(!any(data$State == state)){  stop("invalid state") 
      
           ## Return hospital name in the given state with lowest 30-day death
           ## rate                              
      } else if(outcome == "heart attack"){ 
           ##'rateOneState' to contain Hosp.Name and outcome's death rate for a given state only         
        rateOneState <- subset(data, State == state, select= c(2, 11))

           ##Handling ties: order by death rate (min first), then by hospital (alph), remove NAs
        ordered <- rateOneState[ order( rateOneState[, 2], rateOneState[, 1], na.last = NA ), ] 
        best_hospital<-as.character(ordered[1, 1])
        best_hospital
      
      } else if(outcome == "heart failure"){
          rateOneState <- subset(data, State == state, select= c(2, 17))
          ordered <- rateOneState[ order( rateOneState[, 2], rateOneState[, 1], na.last = NA ), ] #Sortby HF rate, then by hospital, remove NAs
          best_hospital<-as.character(ordered[1, 1])
          best_hospital
      
      } else if(outcome == "pneumonia"){   
          rateOneState <- subset(data, State == state, select= c(2, 23))
          ordered <- rateOneState[ order( rateOneState[, 2], rateOneState[, 1], na.last = NA ), ] #Sortby PN rate, then by hospital, remove NAs
          best_hospital<-as.character(ordered[1, 1])
          best_hospital
      }
}

##test outcome:
## > source("best.R")
## > best("TX", "heart attack")
## [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
## > best("TX", "heart failure")
## [1] "FORT DUNCAN MEDICAL CENTER"
## > best("MD", "heart attack")
## [1] "JOHNS HOPKINS HOSPITAL, THE"
## > best("MD", "pneumonia")
## [1] "GREATER BALTIMORE MEDICAL CENTER
## > best("BB", "heart attack")
## Error in best("BB", "heart attack") : invalid state
## best("NY", "hert attack")
## Error in best("NY", "hert attack") : invalid outcome
## > best("WI", "heart failure")
## [1] "AURORA ST LUKES MEDICAL CENTER" (smallest first)
## > best("WI", "Heart Failure")
## Error in best("WI", "Heart Failure") : invalid outcome