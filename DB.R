# Install necessary packages
#install.packages("dplyr")
#install.packages("hash")

install.packages("ggseas")
# Load libraries
library(devtools)
library(dplyr)
library(hash)

# set the maximum number of rows to be printed
options(max.print = 999999)

# Load the data
datasets::AirPassengers
dbset <- read.csv(url("https://raw.githubusercontent.com/ZiaChiu/KPTEC201/main/res/PPL_C.CSV"))

d_b <- setRefClass(
  "db",
  fields = list(
    db = "data.frame",
    ppl = "hash",
    db_clean = "data.frame",
    date_ppl = "data.frame",
    time_ppl = "data.frame",
    name_ppl = "data.frame",
    currency_ppl = "data.frame",
    gross_ppl = "data.frame",
    date = "character",
    time = "character",
    name = "character",
    currency = "character",
    gross = "numeric",
    checkout_currency = "character",
    checkout_gross = "numeric",
    last_cursor_ppl = "numeric"
  ),
  methods = list(
    # Initialize the variables
    initialize = function() {
      db <<- dbset
      
      date_ppl <<- db %>% select(1)
      time_ppl <<- db %>% select(2)
      name_ppl <<- db %>% select(4)
      currency_ppl <<- db %>% select(6)
      gross_ppl <<- db %>% select(7)
      
      date <<- NULL
      time <<- NULL
      name <<- NULL
      currency <<- NULL
      gross <<- NULL
      checkout_currency <<- NULL
      checkout_gross <<- NULL
      last_cursor_ppl <<- nrow(date_ppl)
      
      # use hash map to store the data
      ppl <<- hash()
      # create the database which will be used to store the data
      db_clean <<- data.frame(
        date = character(),
        time = character(),
        name = character(),
        currency = character(),
        gross = numeric(),
        checkout_currency = character(),
        checkout_gross = numeric(),
        stringsAsFactors = FALSE
      )
    },
    # Clean the data
    clean_db = function() {
      # Process the data
      for (index in 1:last_cursor_ppl) {
        # Iterate over data
        date <<- date_ppl[index, ]
        time <<- time_ppl[index, ]
        name <<- name_ppl[index, ]
        currency <<- currency_ppl[index, ]
        gross <<- as.numeric(gross_ppl[index, ])
        
        tryCatch({
          # try part
          as.numeric(name)
          if (currency != ppl[["currency"]]) {
            ppl[["checkout_currency"]] <<- currency
            ppl[["checkout_gross"]] <<- gross
          } else {
            append_list <<- data.frame(
              date = ppl[["date"]],
              time = ppl[["time"]],
              name = ppl[["name"]],
              currency = ppl[["currency"]],
              gross = ppl[["gross"]],
              checkout_currency = ppl[["checkout_currency"]],
              checkout_gross = ppl[["checkout_gross"]],
              stringsAsFactors = FALSE
            )
            db_clean <<- rbind(db_clean, append_list)
          }
        }, error = function(e) {
          # catch part
        }, warning = function(w) {
          # warning part
          ppl[["name"]] <<- name
          ppl[["currency"]] <<- currency
          ppl[["gross"]] <<- gross
          ppl[["date"]] <<- date
          ppl[["time"]] <<- time
        }, finally = {
          # finally part
        })
      }
    },
    get_db = function() {
      return(db_clean)
    }
  )
)

dn <- d_b$new()
dn$clean_db()
print(dn$get_db())



convert_db <- function() {
  # Convert the AirPassengers time series to a data frame
  df <- as.data.frame(AirPassengers)
  month <- hash()
  month[["1"]] <- "January"
  month[["2"]] <- "February"
  month[["3"]] <- "March"
  month[["4"]] <- "April"
  month[["5"]] <- "May"
  month[["6"]] <- "June"
  month[["7"]] <- "July"
  month[["8"]] <- "August"
  month[["9"]] <- "September"
  month[["10"]] <- "October"
  month[["11"]] <- "November"
  month[["12"]] <- "December"
  data <- data.frame(
    years = character(),
    month = character(),
    passengers = numeric(),
    stringsAsFactors = FALSE
  )
  year <- 1948
  j <- 1
  for (i in 1:nrow(df)) {
    if (i %% 12 == 0) {
      j <- 12
    }else if(i %% 12 == 1) {
      year <- year + 1
    } 
    else {
      j <- (i %% 12)
    }
    
    data <- rbind(data, data.frame(
      years = year,
      month = month[[as.character(j)]],
      passengers = df[i,],
      stringsAsFactors = FALSE
    ))
  }
  return (data)
}


daya <- convert_db()[1]
print(class(daya))


chose_db <- function(){
  print("DB is the dataset from the publicly dataset")
  print("DN is the dataset after my data cleaning that I chose to use")
  question <- readline(prompt = "which databse would you like to use(db or dn) [PS: default is db]? ")
  
  # change the answer to lower case and check the answer
  # Step 2: Data Import: Import the chosen dataset into R using appropriate functions or libraries.
  if (tolower(question) == "db") {
    print("you chose the default db, you are going to use the dataset from the publicly dataset.")
    db <- AirPassengers
    
    
    return(db)
  } else if (tolower(question) == "dn") {
    print("you chose the db which I created by myself, you are going to use the dataset to continue.")
    
    dn <- clean_db()
    
    return(dn)
  } else {
    print("You are so cute (^0^)!")
    print("you chose the default db, you are going to use the dataset from the publicly dataset.")
    db <- AirPassengers
    return(db)
  }
  
}

# Step 1: Dataset Selection: Choose a suitable dataset from publicly available datasets commonly used with R. 
# Some popular options include: 
# 1. AirPassengers/db: Monthly Airline Passenger Numbers 1949-1960
# 2. BankStatements/dn: My own Privacy-processed bank statements from 13/06/2023 to 13/06/2024
d <- chose_db()
print(head(d))




# Step 3: Data Exploration: Perform data exploration by examining the structure, summary statistics, and basic visualisations of the dataset. 
# This step should involve techniques covered in the earlier weeks (Weeks 1, 2, and 3) of the subject. 


# Convert the AirPassengers time series to a data frame
library(hash)
