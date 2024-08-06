# Install necessary packages
# install.packages("dplyr")
# install.packages("r2r")

# Step 2: Data Import: Import the chosen dataset into R using appropriate functions or libraries. 
#         Make sure to include the necessary code for dataset importation in your submission.


# Load libraries
library(devtools)
library(dplyr)
library(r2r)

# Set the maximum number of rows to be printed
options(max.print = 999999)

# Function to clean the database
clean_db <- function() {
  # Read data from the provided URL
  db <- read.csv(url("https://raw.githubusercontent.com/ZiaChiu/KPTEC201/main/res/PPL_C.CSV"))
  
  # Select relevant columns from the dataset
  date_ppl <- db %>% select(1)
  time_ppl <- db %>% select(2)
  name_ppl <- db %>% select(4)
  currency_ppl <- db %>% select(6)
  gross_ppl <- db %>% select(7)
  
  # Get the number of rows in the dataset
  last_cursor_ppl <- nrow(db)
  
  # Use a hash map to store intermediate data
  ppl <- hashmap()
  
  # Create an empty data frame for the cleaned data
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
  
  # Process the data row by row
  for (index in 1:last_cursor_ppl) {
    # Extract values for the current row
    date <- date_ppl[index, ]
    time <- time_ppl[index, ]
    name <- name_ppl[index, ]
    currency <- currency_ppl[index, ]
    gross <- as.numeric(gross_ppl[index, ])
    
    # Try to process the data and catch any errors or warnings
    tryCatch({
      # Attempt to convert 'name' to numeric
      as.numeric(name)
      if (currency != ppl[["currency"]]) {
        # Update checkout currency and gross if the currency has changed
        ppl[["checkout_currency"]] <- currency
        ppl[["checkout_gross"]] <- gross
      } else {
        # Append the data to the cleaned database if the currency has not changed
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
        db_clean <- rbind(db_clean, append_list)
      }
    }, error = function(e) {
      # Handle errors
    }, warning = function(w) {
      # Handle warnings by updating the hash map
      ppl[["name"]] <- name
      ppl[["currency"]] <- currency
      ppl[["gross"]] <- gross
      ppl[["date"]] <- date
      ppl[["time"]] <- time
    }, finally = {
      # Final block (not used in this case)
    })
  }
  return (db_clean)
}

# Function to convert the AirPassengers time series to a data frame
convert_db <- function() {
  # Load the AirPassengers dataset
  datasets::AirPassengers
  
  # Create a hash map for months
  month <- hashmap()
  month[["1"]] <- "Jan"
  month[["2"]] <- "Feb"
  month[["3"]] <- "Mar"
  month[["4"]] <- "Apr"
  month[["5"]] <- "May"
  month[["6"]] <- "Jun"
  month[["7"]] <- "Jul"
  month[["8"]] <- "Aug"
  month[["9"]] <- "Sep"
  month[["10"]] <- "Oct"
  month[["11"]] <- "Nov"
  month[["12"]] <- "Dec"
  
  # Convert the AirPassengers time series to a data frame
  df <- as.data.frame(AirPassengers)
  data_hash <- hashmap()
  
  # Create an empty data frame for the converted data
  data <- data.frame(
    years = character(),
    Jan = numeric(),
    Feb = numeric(),
    Mar = numeric(),
    Apr = numeric(),
    May = numeric(),
    Jun = numeric(),
    Jul = numeric(),
    Aug = numeric(),
    Sep = numeric(),
    Oct = numeric(),
    Nov = numeric(),
    Dec = numeric(),
    stringsAsFactors = FALSE
  )
  
  year <- 1948
  j <- 1
  
  # Process the AirPassengers data
  for (i in 1:nrow(df)) {
    if (length(data_hash) == 13) {
      # Append the data to the final data frame if all months are filled
      append_list <- data.frame(
        years = data_hash[["years"]],
        Jan = data_hash[["Jan"]],
        Feb = data_hash[["Feb"]],
        Mar = data_hash[["Mar"]],
        Apr = data_hash[["Apr"]],
        May = data_hash[["May"]],
        Jun = data_hash[["Jun"]],
        Jul = data_hash[["Jul"]],
        Aug = data_hash[["Aug"]],
        Sep = data_hash[["Sep"]],
        Oct = data_hash[["Oct"]],
        Nov = data_hash[["Nov"]],
        Dec = data_hash[["Dec"]],
        stringsAsFactors = FALSE
      )
      data <- rbind(data, append_list)
      data_hash <- hashmap()  # Reset the hash map
    }
    
    # Determine the month based on the index
    if (i %% 12 == 0) {
      j <- 12
    } else if (i %% 12 == 1) {
      year <- year + 1
      data_hash[["years"]] <- year
      j <- 1
    } else {
      j <- (i %% 12)
    }
    
    # Store the passenger count for the corresponding month
    switch (month[[as.character(j)]],
            Jan = { data_hash[["Jan"]] <- df[i,] },
            Feb = { data_hash[["Feb"]] <- df[i,] },
            Mar = { data_hash[["Mar"]] <- df[i,] },
            Apr = { data_hash[["Apr"]] <- df[i,] },
            May = { data_hash[["May"]] <- df[i,] },
            Jun = { data_hash[["Jun"]] <- df[i,] },
            Jul = { data_hash[["Jul"]] <- df[i,] },
            Aug = { data_hash[["Aug"]] <- df[i,] },
            Sep = { data_hash[["Sep"]] <- df[i,] },
            Oct = { data_hash[["Oct"]] <- df[i,] },
            Nov = { data_hash[["Nov"]] <- df[i,] },
            Dec = { data_hash[["Dec"]] <- df[i,] }
    )
    
    if (i == nrow(df)) {
      # Append the last set of data
      append_list <- data.frame(
        years = data_hash[["years"]],
        Jan = data_hash[["Jan"]],
        Feb = data_hash[["Feb"]],
        Mar = data_hash[["Mar"]],
        Apr = data_hash[["Apr"]],
        May = data_hash[["May"]],
        Jun = data_hash[["Jun"]],
        Jul = data_hash[["Jul"]],
        Aug = data_hash[["Aug"]],
        Sep = data_hash[["Sep"]],
        Oct = data_hash[["Oct"]],
        Nov = data_hash[["Nov"]],
        Dec = data_hash[["Dec"]],
        stringsAsFactors = FALSE
      )
      data <- rbind(data, append_list)
    }
  }
  return(data)
}

# Function to choose the database
chose_db <- function(ans = "db") {
  print("DB is the dataset from the publicly dataset")
  print("DN is the dataset after my data cleaning that I chose to use")
  
  # Convert the answer to lowercase and check the answer
  if (tolower(ans) == "db") {
    print("You chose the default db, you are going to use the dataset from the publicly dataset.")
    db <- convert_db()
    return(db)
  } else if (tolower(ans) == "dn") {
    print("You chose the db which I created by myself, you are going to use the dataset to continue.")
    dn <- clean_db()
    return(dn)
  } else {
    print("You are so cute (^0^)!")
    print("You chose the default db, you are going to use the dataset from the publicly dataset.")
    db <- convert_db()
    return(db)
  }
}

# Step 1: Dataset Selection: Choose a suitable dataset from publicly available datasets commonly used with R. 
# Some popular options include: 
# 1. AirPassengers/db: Monthly Airline Passenger Numbers 1949-1960
# 2. BankStatements/dn: My own Privacy-processed bank statements from 13/06/2023 to 13/06/2024

# Ask the user which database they would like to use
question <- readline(prompt = "Which database would you like to use (db or dn) [PS: default is db]? ")

# Check if the user input is valid
# %in% means "not in"
if (question %in% c("db", "dn")) {
  question <- "db"
}

# Assign the value of the question to the variable 'ans'
# The same value but different memory location.
# Ensure that the value of question is not tainted by future memory modifications.
assign("ans", question)

print(paste("ans",as.character(ans)))

# Choose and load the selected database
d <- chose_db(ans)
