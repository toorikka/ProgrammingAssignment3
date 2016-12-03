# Programming Assignment 3
## R programming week 4 assignment

## Data

The data for this assignment come from the Hospital Compare web site (http://hospitalcompare.hhs.gov)
run by the U.S. Department of Health and Human Services.

The  Hospital  Compare  web  site  contains  a  lot  of  data  and  we  will  only  look  at  a  small  subset  for  this
assignment.  The zip  file for this assignment contains three files
* outcome-of-care-measures.csv: Contains information about 30-day mortality and readmission rates
for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.
* hospital-data.csv:  Contains information about each hospital.
* Hospital_Revised_Flatfiles.pdf:  Descriptions of the variables in each  le (i.e the code book).

The zip file containing the data for this assignment can be downloaded here:
https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip
   
## Functions in the assignment

1. **best.R**: Finding the best hospital in a state for outcome ('heart attack', 'heart failiure' or 'pneumonia').
 ```{r}
best <- function(state, outcome) {
* Read outcome data
* Check that state and outcome are valid
* Return hospital name in that state with lowest 30-day death
* Rate
} 
```

2. **Rankhospital.R**: Ranking the hospital by outcome ('heart attack', 'heart failiure' or 'pneumonia') in a state
 ```{r}
rankhospital <- function(state, outcome, num = "best") {
* Read outcome data
* Check that state and outcome are valid
* Return hospital name in that state with the given rank
* 30-day death rate
}
```

3. **Rankall.R**: Ranking hospitals in all states
 ```{r}
rankall <- function(outcome, num = "best") {
* Read outcome data
* Check that state and outcome are valid
* For each state, find the hospital of the given rank
* Return a data frame with the hospital names and the
* (abbreviated) state name
}
```


### Tests: 
best.R
test outcome:
 > `source("best.R")`

 > `best("TX", "heart attack")`
 [1] "CYPRESS FAIRBANKS MEDICAL CENTER"

 > best("TX", "heart failure")
 [1] "FORT DUNCAN MEDICAL CENTER"

 > best("MD", "heart attack")
 [1] "JOHNS HOPKINS HOSPITAL, THE"

 > best("MD", "pneumonia")
 [1] "GREATER BALTIMORE MEDICAL CENTER

 > best("BB", "heart attack")
 Error in best("BB", "heart attack") : invalid state

 > best("NY", "hert attack")
 Error in best("NY", "hert attack") : invalid outcome

 > best("WI", "heart failure")
 [1] "AURORA ST LUKES MEDICAL CENTER" (smallest first)

 > best("WI", "Heart Failure")
 Error in best("WI", "Heart Failure") : invalid outcome

   
rankhospital.R
testing outcome:

 > `rankhospital("TX", "heart failure", 4)`
 [1] "DETAR HOSPITAL NAVARRO"

 > rankhospital("MD", "heart attack", "worst")
 [1] "HARFORD MEMORIAL HOSPITAL"

 > rankhospital("TX", "heart failure", "best")
 [1] "FORT DUNCAN MEDICAL CENTER"

   
rankall.R
testing outcome (row names = state):

 > `head(rankall("heart attack", 20), 10)`


 >  AK                                NA    AK

> AL      D W MCMILLAN MEMORIAL HOSPITAL    AL

> AR   ARKANSAS METHODIST MEDICAL CENTER    AR

> AZ JOHN C LINCOLN DEER VALLEY HOSPITAL    AZ

> CA               SHERMAN OAKS HOSPITAL    CA

> CO            SKY RIDGE MEDICAL CENTER    CO

> CT             MIDSTATE MEDICAL CENTER    CT

> DC                                NA    DC

> DE                                NA    DE

> FL      SOUTH FLORIDA BAPTIST HOSPITAL    FL

   

 >`tail(rankall("pneumonia", "worst"), 3)`


> WI MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC    WI

> WV                     PLATEAU MEDICAL CENTER    WV

> WY           NORTH BIG HORN HOSPITAL DISTRICT    WY



 

