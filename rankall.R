rankall <- function(outcome, num = "best") {
    ## Read outcome data, change "Not Available" to NA
  data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available") 
  df = data.frame("hospital"=character(), "state"=character())
  
        ##create df with named columns for different outcomes
  causes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
  
        ##check that outcome is valid
  if(!(outcome %in% names(causes))){stop("invalid outcome")}
   
       ## cause is one of three
    all.states <- subset(data, select= c(2, 7, causes[outcome])) ##df w/ 3 cols for the given outcome
    names(all.states) <- c("hospital", "state", "outcome")
    ordered <- all.states[ order( all.states[, 2], all.states[, 3], all.states[, 1], na.last = NA ), ] ##order df columns and remove NAs
    statelist <- split(ordered, ordered$state) # split to 54 pieces based on state
    states <- levels(ordered[,2]) ##list of states
    ##hos <- lapply(statelist,"[",1,1) testing lapply
    
     
      #### function: For each state, find the hospital of the given rank
     hos <- sapply(statelist, function(statelist){
        if(num == "best"){
          hos <- statelist[1,1]
        }else if (num == "worst"){
          hos <- statelist[nrow(statelist),1]
      ##}else if (num > nrow){ return(NA)
        }else  { 
        hos <- statelist[num,1]
      }
     })
     
     ## Return a data frame with the hospital names and the
     ## (abbreviated) state name
  df <- data.frame(hospital=hos, state=states)
  rownames(df) <- states
    
  return(df)
 
}

 ## returns a 2-column data frame containing the hospital in 
  ##each state that has the ranking specied in num.
##> head(rankall("heart attack", 20), 10)
##hospital state
##AK                                <NA>    AK
##AL      D W MCMILLAN MEMORIAL HOSPITAL    AL
##AR   ARKANSAS METHODIST MEDICAL CENTER    AR
##AZ JOHN C LINCOLN DEER VALLEY HOSPITAL    AZ
##CA               SHERMAN OAKS HOSPITAL    CA
##CO            SKY RIDGE MEDICAL CENTER    CO
##CT             MIDSTATE MEDICAL CENTER    CT
##DC                                <NA>    DC
##DE                                <NA>    DE
##FL      SOUTH FLORIDA BAPTIST HOSPITAL    FL
