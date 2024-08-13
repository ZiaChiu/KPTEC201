
source("https://raw.githubusercontent.com/ZiaChiu/KPTEC201/main/DB.R")

library(ggplot2)
library(tidyr)
library(base)

# save plot as png
save_plot <- function(p, filename) {
  ggsave(filename, plot = p, device = "png", dpi = 300)
  if (file.exists(paste("./", filename, sep = ""))) {
    print(paste("Plot saved as", filename))
    return(paste("./", filename))
  } else {
    #overwrite the file
    unlink(paste("./", filename),recursive = FALSE, force = FALSE,extends = TRUE)
    return(paste("./", filename))
  }
}


# Step 3: Data Exploration: Perform data exploration by examining the structure, 
# summary statistics, and basic visualisations of the dataset. 
# This step should involve techniques covered in the earlier weeks (Weeks 1, 2, and 3) of the subject.


#####################
# For db dataset part
#####################
get_year_i_month <- function(y) {
  year_data <- d %>%
    filter(years == y)
  return(year_data)
}

get_month_i_year <- function(m) {
  m <- match.arg(month[[m]], c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))
  
  month_data <- d %>%
    select(Year = years, Passengers = all_of(m))
  
  return(month_data)
}

# Display the plot of the dataset every month in year
display_miy_plot <- function(y, plot_type = "line") {
  year_data <- get_year_i_month(y)
  if (plot_type == "line") {
    p <- ggplot(year_data, aes(x = Month, y = Passengers, group = 1)) +
      geom_line(color = "blue") +
      geom_point(color = "blue") +
      ggtitle(paste("Air Passengers in", y)) +
      xlab("Month") +
      ylab("Number of Passengers")
    print(p)
    save_plot(p, paste("Apy.png"))
    
  } else if (plot_type == "bar") {
    p <- ggplot(year_data, aes(x = Month, y = Passengers)) +
      geom_bar(stat = "identity", fill = "skyblue") +
      ggtitle(paste("Air Passengers in", y)) +
      xlab("Month") +
      ylab("Number of Passengers")
    print(p)
    save_plot(p, paste("Apy.png"))
  } else {
    stop("Invalid plot type. Please use 'line' or 'bar'.")
  }
}


# Display the plot of the dataset every year in month
display_yim_plot <- function(m, plot_tp = "line") {
  get_month_i_year(m)
  if (plot_tp == "line") {
    p <- ggplot(month_data, aes(x = Year, y = Passengers, group = 1)) +
      geom_line(color = "red") +
      geom_point(color = "red") +
      ggtitle(paste("Air Passengers in", m)) +
      xlab("Year") +
      ylab("Number of Passengers")
    print(p)
    save_plot(p, paste("Apm.png"))
  } else if (plot_tp == "bar") {
    p <- ggplot(month_data, aes(x = Year, y = Passengers)) +
      geom_bar(stat = "identity", fill = "lightgreen") +
      ggtitle(paste("Air Passengers in", m, "by Year")) +
      xlab("Year") +
      ylab("Number of Passengers")
    print(p)
    save_plot(p, paste("Apm.png"))

  } else {
    stop("Invalid plot type. Please use 'line' or 'bar'.")
  }
}


frequency_passenger_month <- function(mos){

  fmonth_data <- get_month_i_year(month[[mos]])
  
  hist(fmonth_data$Passengers, main = paste("Frequency Diagram for", month[[mos]]), xlab = paste("Passengers in", month[[mos]]), col = "blue")
  
  # Generate the frequency plot
  fmA <-ggplot(fmonth_data, aes(x = SpecifiedMonth)) +
    geom_histogram(binwidth = 10, fill = "blue", color = "black") +
    xlab(paste("Passengers in", specified_month)) +
    ylab("Frequency") +
    ggtitle(paste("Frequency Diagram for", specified_month, "Across Calendar Years"))
  
  save_plot(fmA, "fmA.png")
}


frequency_passenger_year <- function(yrs){
  
  fyear_data <- get_year_i_month(yrs)
  
  # Reshape the data to long format for frequency analysis
  year_data_long <- fyear_data %>%
    gather(key = "Month", value = "Passengers", Jan:Dec)
  
  hist(fyear_data$Passengers, main = paste("Frequency Diagram for", yrs), xlab = paste("Passengers in", yrs), col = "red")
  
  # Generate the frequency plot
  fyA <- ggplot(year_data_long, aes(x = Passengers)) +
    geom_histogram(binwidth = 10, fill = "red", color = "black") +
    xlab(paste("Passengers in", specified_year)) +
    ylab("Frequency") +
    ggtitle(paste("Frequency Diagram for", specified_year))
  save_plot(fyA, "fyA.png")
}


#####################
# For dn dataset part
#####################

get_summarize_month_i_year <- function(m) {
  # Convert the date column to Date type and extract the month-year
  d$date <- as.Date(d$date, format = "%d/%m/%Y")
  d$month_year <- format(d$date, "%Y-%m")
  
  # Filter for CNY currency and calculate total spending per month
  total_monthly_spending <- d %>%
    filter(checkout_currency == "CNY") %>%
    group_by(month_year) %>%
    summarize(total_spending = sum(checkout_gross, na.rm = TRUE))
}

get_spend_daily_i_year <-function(){
  # Convert the date column to Date type and extract the day
  d$date <- as.Date(d$date, format = "%d/%m/%Y")
  d$day <- format(d$date, "%d")
  
  # Filter for CNY currency and calculate total spending per day
  total_daily_spending <- d %>%
    filter(checkout_currency == "CNY") %>%
    group_by(day) %>%
    summarize(total_spending = sum(checkout_gross, na.rm = TRUE))
  return(total_daily_spending)
}


display_statement_month_plot <- function(){
  total_monthly_spending <- get_summarize_month_i_year()
  # Plot the total monthly spending in CNY
  plot_months <-ggplot(total_monthly_spending, aes(x = month_year, y = total_spending)) +
    geom_bar(stat = "identity", fill = "skyblue") +
    xlab("Month-Year") +
    ylab("Total Spending in CNY") +
    ggtitle("Total Monthly Spending in CNY for the Year") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  save_plot(plot_months, "plot_months.png")
}

display_statement_daily_plot <- function(){
  total_daily_spending <- get_spend_daily_i_year()
  # Plot the total daily spending in CNY
  plot_days <- ggplot(total_daily_spending, aes(x = day, y = total_spending)) +
    geom_bar(stat = "identity", fill = "lightgreen") +
    xlab("Day") +
    ylab("Total Spending in CNY") +
    ggtitle("Total Daily Spending in CNY for the Year")
  save_plot(plot_days, "plot_days.png")
}