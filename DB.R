# Install necessary packages
install.packages("dplyr")
install.packages("hash")

# Load libraries
library(dplyr)
library(hash)

options(max.print=999999)

# Load the data
db <- read.csv("PPL_C.csv")

# Select columns
date_ppl <- db %>% select(1)
time_ppl <- db %>% select(2)
name_ppl <- db %>% select(4)
currency_ppl <- db %>% select(6)
gross_ppl <- db %>% select(7)
last_cursor_ppl <- nrow(date_ppl)

clean_db <- function() {
  # Initialize the variables
  date <- NULL
  time <- NULL
  name <- NULL
  currency <- NULL
  gross <- NULL
  checkout_currency <- NULL
  checkout_gross <- NULL
  ppl <- hash()
  db_clean <- data.frame(
    date = character(),
    time = character(),
    name = character(),
    currency = character(),
    gross = numeric(),
    checkout_currency = character(),
    checkout_gross = numeric(),
    stringsAsFactors = FALSE
  )
  
  # Process the data
  for (index in 1:last_cursor_ppl) {
    # Iterate over data
    date <- date_ppl[index,]
    time <- time_ppl[index,]
    name <- name_ppl[index,]
    currency <- currency_ppl[index,]
    gross <- gross_ppl[index,]
    
    # clean the data
    tryCatch({
      # try part
      as.numeric(name)
      if (currency != ppl[["currency"]]) {
        ppl[["checkout_currency"]] <- currency
        ppl[["checkout_gross"]] <- gross
      } else {
        append_list <- data.frame(
          date = ppl[["date"]],
          time = ppl[["time"]],
          name = ppl[["name"]],
          currency = ppl[["currency"]],
          gross = ppl[["gross"]],
          checkout_currency = ppl[["checkout_currency"]],
          checkout_gross = ppl[["checkout_gross"]],
          stringsAsFactors = FALSE
        )
        print(paste("append_list:", append_list))
        db_clean <- rbind(db_clean, append_list)
        print("Currencies are the same")
        print('End of the data cleaning for this index')
      }
    }, error = function(e) {
      # catch part
      
      print("Error index:", index)
    }, warning = function(w) {
      # warning part
      ppl[["name"]] <- name
      ppl[["currency"]] <- currency
      ppl[["gross"]] <- gross
      ppl[["date"]] <- date
      ppl[["time"]] <- time

    }, finally = {
      # finally part
      print(ppl)
    })
  }
  
  # return db
  return(db_clean)
}

dn <- clean_db()

bank <- read.csv("bank.csv")




