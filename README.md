# Programming Assignment 3
R programming week 3 assignment

tests: 
best.R
test outcome:
 > source("best.R")
 > best("TX", "heart attack")
 [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
 > best("TX", "heart failure")
 [1] "FORT DUNCAN MEDICAL CENTER"
 > best("MD", "heart attack")
 [1] "JOHNS HOPKINS HOSPITAL, THE"
 > best("MD", "pneumonia")
 [1] "GREATER BALTIMORE MEDICAL CENTER
 > best("BB", "heart attack")
 Error in best("BB", "heart attack") : invalid state
 best("NY", "hert attack")
 Error in best("NY", "hert attack") : invalid outcome
 > best("WI", "heart failure")
 [1] "AURORA ST LUKES MEDICAL CENTER" (smallest first)
 > best("WI", "Heart Failure")
 Error in best("WI", "Heart Failure") : invalid outcome

rankhospital.R
testing outcome:
> rankhospital("TX", "heart failure", 4)
[1] "DETAR HOSPITAL NAVARRO"
> rankhospital("MD", "heart attack", "worst")
[1] "HARFORD MEMORIAL HOSPITAL"
> rankhospital("TX", "heart failure", "best")
[1] "FORT DUNCAN MEDICAL CENTER"

rankall.R
testing outcome:
> head(rankall("heart attack", 20), 10)
				hospital state
AK                                <NA>    AK
AL      D W MCMILLAN MEMORIAL HOSPITAL    AL
AR   ARKANSAS METHODIST MEDICAL CENTER    AR
AZ JOHN C LINCOLN DEER VALLEY HOSPITAL    AZ
CA               SHERMAN OAKS HOSPITAL    CA
CO            SKY RIDGE MEDICAL CENTER    CO
CT             MIDSTATE MEDICAL CENTER    CT
DC                                <NA>    DC
DE                                <NA>    DE
FL      SOUTH FLORIDA BAPTIST HOSPITAL    FL
>tail(rankall("pneumonia", "worst"), 3)
				       hospital state
WI MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC    WI
WV                     PLATEAU MEDICAL CENTER    WV
WY           NORTH BIG HORN HOSPITAL DISTRICT    WY

> tail(rankall("heart failure"), 10)
                                                            hospital
TN                         WELLMONT HAWKINS COUNTY MEMORIAL HOSPITAL
TX                                        FORT DUNCAN MEDICAL CENTER
UT VA SALT LAKE CITY HEALTHCARE - GEORGE E. WAHLEN VA MEDICAL CENTER
VA                                          SENTARA POTOMAC HOSPITAL
VI                            GOV JUAN F LUIS HOSPITAL & MEDICAL CTR
VT                                              SPRINGFIELD HOSPITAL
WA                                         HARBORVIEW MEDICAL CENTER
WI                                    AURORA ST LUKES MEDICAL CENTER
WV                                         FAIRMONT GENERAL HOSPITAL
WY                                        CHEYENNE VA MEDICAL CENTER
   state
TN    TN
TX    TX
UT    UT
VA    VA
VI    VI
VT    VT
WA    WA
WI    WI
WV    WV
WY    WY
(unfortunately small screen split the result...)

and one final:
> r <- rankall("pneumonia", "worst")
> as.character(subset(r, state == "NJ")$hospital)
[1] "BERGEN REGIONAL MEDICAL CENTER