

######################

# for db part

######################


calculate_year_in_months_freq <- function(year, binwidth = 10) {
  year_freq_data <- get_year_in_months_frequency(year, binwidth)
  
  # Calculate and display statistics
  cat("Year:", year, "\n")
  cat("Mean:", mean(year_freq_data$frequency), "\n")
  cat("Median:", median(year_freq_data$frequency), "\n")
  cat("Mode:", names(sort(table(year_freq_data$frequency), decreasing = TRUE))[1], "\n")
  cat("Variance:", var(year_freq_data$frequency), "\n")
  cat("Standard Deviation:", sd(year_freq_data$frequency), "\n")
  cat("Range:", range(year_freq_data$frequency), "\n")
  cat("Q1:", quantile(year_freq_data$frequency, 0.25), "\n")
  cat("Q3:", quantile(year_freq_data$frequency, 0.75), "\n")
  cat("IQR:", IQR(year_freq_data$frequency), "\n\n")
}

calculate_month_in_years_freq <- function(month, binwidth = 10) {
  month_freq_data <- get_month_in_years_frequency(month, binwidth)
  
  # Calculate and display statistics
  cat("Month:", month, "\n")
  cat("Mean:", mean(month_freq_data$frequency), "\n")
  cat("Median:", median(month_freq_data$frequency), "\n")
  cat("Mode:", names(sort(table(month_freq_data$frequency), decreasing = TRUE))[1], "\n")
  cat("Variance:", var(month_freq_data$frequency), "\n")
  cat("Standard Deviation:", sd(month_freq_data$frequency), "\n")
  cat("Range:", range(month_freq_data$frequency), "\n")
  cat("Q1:", quantile(month_freq_data$frequency, 0.25), "\n")
  cat("Q3:", quantile(month_freq_data$frequency, 0.75), "\n")
  cat("IQR:", IQR(month_freq_data$frequency), "\n\n")
}

calculate_miy <- function(year) {
  year_data <- get_year_i_month(year)
  
  # Calculate and display statistics
  cat("Month in Year for", year, "\n")
  cat("Mean:", mean(year_data$Passengers), "\n")
  cat("Median:", median(year_data$Passengers), "\n")
  cat("Mode:", names(sort(table(year_data$Passengers), decreasing = TRUE))[1], "\n")
  cat("Variance:", var(year_data$Passengers), "\n")
  cat("Standard Deviation:", sd(year_data$Passengers), "\n")
  cat("Range:", range(year_data$Passengers), "\n")
  cat("Q1:", quantile(year_data$Passengers, 0.25), "\n")
  cat("Q3:", quantile(year_data$Passengers, 0.75), "\n")
  cat("IQR:", IQR(year_data$Passengers), "\n\n")
}

calculate_yim <- function(month) {
  month_data <- get_month_i_year(month)
  
  # Calculate and display statistics
  cat("Year in Month for", month, "\n")
  cat("Mean:", mean(month_data$Passengers), "\n")
  cat("Median:", median(month_data$Passengers), "\n")
  cat("Mode:", names(sort(table(month_data$Passengers), decreasing = TRUE))[1], "\n")
  cat("Variance:", var(month_data$Passengers), "\n")
  cat("Standard Deviation:", sd(month_data$Passengers), "\n")
  cat("Range:", range(month_data$Passengers), "\n")
  cat("Q1:", quantile(month_data$Passengers, 0.25), "\n")
  cat("Q3:", quantile(month_data$Passengers, 0.75), "\n")
  cat("IQR:", IQR(month_data$Passengers), "\n\n")
}


######################

# for dn part

######################

cal_msd <- function() {
  monthly_data <- get_summarize_month_i_year()
  
  # Calculate and display statistics
  cat("Monthly Spending Data\n")
  cat("Mean:", mean(monthly_data$total_spending), "\n")
  cat("Median:", median(monthly_data$total_spending), "\n")
  cat("Mode:", names(sort(table(monthly_data$total_spending), decreasing = TRUE))[1], "\n")
  cat("Variance:", var(monthly_data$total_spending), "\n")
  cat("Standard Deviation:", sd(monthly_data$total_spending), "\n")
  cat("Range:", range(monthly_data$total_spending), "\n")
  cat("Q1:", quantile(monthly_data$total_spending, 0.25), "\n")
  cat("Q3:", quantile(monthly_data$total_spending, 0.75), "\n")
  cat("IQR:", IQR(monthly_data$total_spending), "\n\n")
}

calculate_dsd <- function() {
  daily_data <- get_spend_daily_i_year()
  
  # Calculate and display statistics
  cat("Daily Spending Data\n")
  cat("Mean:", mean(daily_data$total_spending), "\n")
  cat("Median:", median(daily_data$total_spending), "\n")
  cat("Mode:", names(sort(table(daily_data$total_spending), decreasing = TRUE))[1], "\n")
  cat("Variance:", var(daily_data$total_spending), "\n")
  cat("Standard Deviation:", sd(daily_data$total_spending), "\n")
  cat("Range:", range(daily_data$total_spending), "\n")
  cat("Q1:", quantile(daily_data$total_spending, 0.25), "\n")
  cat("Q3:", quantile(daily_data$total_spending, 0.75), "\n")
  cat("IQR:", IQR(daily_data$total_spending), "\n\n")
}

cal_msf <- function(binwidth = 100) {
  monthly_freq_data <- get_monthly_spending_frequency(binwidth)
  
  # Calculate and display statistics
  cat("Monthly Spending Frequency\n")
  cat("Mean:", mean(monthly_freq_data$frequency), "\n")
  cat("Median:", median(monthly_freq_data$frequency), "\n")
  cat("Mode:", names(sort(table(monthly_freq_data$frequency), decreasing = TRUE))[1], "\n")
  cat("Variance:", var(monthly_freq_data$frequency), "\n")
  cat("Standard Deviation:", sd(monthly_freq_data$frequency), "\n")
  cat("Range:", range(monthly_freq_data$frequency), "\n")
  cat("Q1:", quantile(monthly_freq_data$frequency, 0.25), "\n")
  cat("Q3:", quantile(monthly_freq_data$frequency, 0.75), "\n")
  cat("IQR:", IQR(monthly_freq_data$frequency), "\n\n")
}

cal_dsf <- function(binwidth = 100) {
  daily_freq_data <- get_daily_spending_frequency(binwidth)
  
  # Calculate and display statistics
  cat("Daily Spending Frequency\n")
  cat("Mean:", mean(daily_freq_data$frequency), "\n")
  cat("Median:", median(daily_freq_data$frequency), "\n")
  cat("Mode:", names(sort(table(daily_freq_data$frequency), decreasing = TRUE))[1], "\n")
  cat("Variance:", var(daily_freq_data$frequency), "\n")
  cat("Standard Deviation:", sd(daily_freq_data$frequency), "\n")
  cat("Range:", range(daily_freq_data$frequency), "\n")
  cat("Q1:", quantile(daily_freq_data$frequency, 0.25), "\n")
  cat("Q3:", quantile(daily_freq_data$frequency, 0.75), "\n")
  cat("IQR:", IQR(daily_freq_data$frequency), "\n\n")
}



######################
##
#......  Run  ........ 
##
######################





