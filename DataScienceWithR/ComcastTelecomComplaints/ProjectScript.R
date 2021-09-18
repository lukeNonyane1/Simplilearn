getwd()
customer_complaints = read.csv("Comcast Telecom Complaints data1.csv", sep=",")
View(customer_complaints)
str(customer_complaints)
# convert Status, Received.Via, Filing.on.Behalf.of.Someone to factor from char
install.packages("plyr")
library(plyr)
customer_complaints$Received.Via <- sapply(customer_complaints$Received.Via, factor)
customer_complaints$Status <- sapply(customer_complaints$Status, factor)
customer_complaints$Filing.on.Behalf.of.Someone <- sapply(customer_complaints$Filing.on.Behalf.of.Someone, factor)

# Monthly trend chart for number of complaints y
# https://r-coder.com/plot-r/
# x=date y=complaints
# Format date column to be the same. https://www.stat.berkeley.edu/~s133/dates.html
customer_complaints$Date
# https://www.rdocumentation.org/packages/lubridate/versions/1.7.10
install.packages("lubridate")
library(lubridate)
v1 <- as.POSIXlt((parse_date_time(customer_complaints$Date, c('dmy'))))
complaint_months <- month(v1)
complaint_months

# Set complaint_months to factor (effectively binning)
#complaint_months <- sapply(complaint_months, factor)
#complaint_months

# Create function that records month of complaint and assigns to correct month.
# We can see the distinct months in our records are 1-12 Jan-Dec.
complaint_months_to_char <- sapply(complaint_months, character)
complaint_months_to_char

count_of_Jan <- 0
count_of_Feb <- 0
count_of_Mar <- 0
count_of_Apr <- 0
count_of_May <- 0
count_of_Jun <- 0
count_of_Jul <- 0
count_of_Aug <- 0
count_of_Sep <- 0
count_of_Oct <- 0
count_of_Nov <- 0
count_of_Dec <- 0

for(item in complaint_months){
  if(item == "1") count_of_Jan <- count_of_Jan + 1
  if(item == "2") count_of_Feb <- count_of_Feb + 1
  if(item == "3") count_of_Mar <- count_of_Mar + 1
  if(item == "4") count_of_Apr <- count_of_Apr + 1
  if(item == "5") count_of_May <- count_of_May + 1
  if(item == "6") count_of_Jun <- count_of_Jun + 1
  if(item == "7") count_of_Jul <- count_of_Jul + 1
  if(item == "8") count_of_Aug <- count_of_Aug + 1
  if(item == "9") count_of_Sep <- count_of_Sep + 1
  if(item == "10") count_of_Oct <- count_of_Oct + 1
  if(item == "11") count_of_Nov <- count_of_Nov + 1
  if(item == "12") count_of_Dec <- count_of_Dec + 1
}

count_of_Jan
count_of_Feb
count_of_Mar
count_of_Apr
count_of_May
count_of_Jun
count_of_Jul
count_of_Aug
count_of_Sep
count_of_Oct
count_of_Nov
count_of_Dec

# Create month name bank to be used for the plot
month_name_bank <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

# Provide the trend chart for the number of complaints at monthly  granularity levels.
#x <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
x
y <- c(count_of_Jan, count_of_Feb, count_of_Mar, count_of_Apr, count_of_May, count_of_Jun, count_of_Jul, count_of_Aug, count_of_Sep, count_of_Oct, count_of_Nov, count_of_Dec)
y
plot(x, y, xlab="Months", ylab="Number of complaints", type="b", main="Monthly Trend Chart of Customer Complaints", xlim=c(1,12), ylim=c(0,1500))
# https://stackoverflow.com/questions/13229546/how-can-i-label-points-in-this-scatterplot
text(x, y, labels = month_name_bank, cex = 0.7, pos=3)

# Provide the trend chart for the number of complaints at daily granularity levels
v1$wday
# We can see our days of the week range from 0-6 (Sun-Sat)

# Store days of week in variable days_of_week
days_of_week <- v1$wday
days_of_week

# Iterate through days_of_week and sum the distinct occurrence of week day
# Define count variables of each day of the week and assign 0 as the value.
#Sun-Sat:0-6
count_Sun <- 0
count_Mon <- 0
count_Tue <- 0
count_Wed <- 0
count_Thur <- 0
count_Fri <- 0
count_Sat <- 0

for(item in days_of_week){
  if(item == 0) count_Sun <- count_Sun + 1
  if(item == 1) count_Mon <- count_Mon + 1
  if(item == 2) count_Tue <- count_Tue + 1
  if(item == 3) count_Wed <- count_Wed + 1
  if(item == 4) count_Thur <- count_Thur + 1
  if(item == 5) count_Fri <- count_Fri + 1
  if(item == 6) count_Sat <- count_Sat + 1
}

count_Sun
count_Mon
count_Tue
count_Wed
count_Thur
count_Fri
count_Sat

name_of_days <- c("Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat")
# Plot x(Days of the week from 0-6) y(count of each day of the week)
x1 <- c(0 ,1, 2, 3, 4, 5, 6)
y1 <- c(count_Sun, count_Mon, count_Tue, count_Wed, count_Thur, count_Fri, count_Sat)
plot(x1, y1, xlab="Days of week", ylab="Number of complaints", type="b", main="Daily Trend Chart of Customer Complaints", xlim=c(0,6), ylim=c(0,500))
text(x1, y1, labels = name_of_days, cex = 0.7, pos=3)

############################################################################

# Provide a table with the frequency of complaint types.
# https://www.statology.org/create-table-in-r/
complaint_types <- sapply(customer_complaints$Customer.Complaint, factor)
plyr::count(complaint_types) # These are the distinct complaint types; 1841
complaint_types_table <- plyr::count(complaint_types)
View(complaint_types_table)

############################################################################

# Create a new categorical variable with value as Open and Closed. 
# Open & Pending is to be categorized as Open and Closed & Solved is to be categorized as Closed.
trial_data = read.csv("Comcast Telecom Complaints data1.csv", sep=",")
trial_df <- tibble(trial_data)
head(trial_df)

install.packages("dplyr")
library(dplyr)

trial_df <- trial_df %>%
  mutate(condensed_status = case_when(Status == 'Open' | Status == 'Pending' ~ 'Open',
                                      Status == 'Solved' | Status == 'Closed' ~ 'Closed'))

View(trial_df)

############################################################################

## Provide state wise status of complaints in a stacked bar chart. Use the categorized variable from Q3##

# How many different states do we have? 
sapply(customer_complaints$State, factor)

# Colors for the legend
  # showCols(bg="gray20",cl=colors()[1:60], rot=30, cex=0.9)
  # showCols(cl= colors(), bg="gray33", rot=30, cex=0.75)        
  # View(showCols(cl= colors(), bg="gray33", rot=30, cex=0.75))
  # colors <- showCols(cl = colors(), bg = "gray33", rot = 30, cex = 0.75)[["label"]]

statewise_complaints <- table(trial_df$State,trial_df$condensed_status)

barplot(statewise_complaints,
        main="Statewise complaints",
        col=c("grey", "cornflowerblue", "aliceblue", "bisque2", "blueviolet", "brown4", "burlywood4", "cadetblue4",
              "chartreuse4", "chocolate4", "coral4", "cornsilk3", "cyan3", "darkgoldenrod1", "darkgreen", "darkolivegreen1",
              "darkorange1", "darkorchid1", "darksalmon", "darkseagreen4", "darkslategray3", "deeppink", "deepskyblue",
              "dimgray", "dodgerblue3", "firebrick3", "gold4", "goldenrod4", "gray3", "honeydew4", "hotpink4", "indianred4",
              "ivory4", "khaki4", "lavenderblush3", "lemonchiffon2", "lightblue2", "lightcyan1", "lightgoldenrod1",
              "lightyellow3", "magenta1", "maroon1", "mediumblue", "mediumorchid4"),
        legend.text = TRUE,
        args.legend = list(x = "topright",
                           inset = c(-0.009, -0.1),
                           cex=0.265))

############################################################################

# Which state has the maximum complaints
open_complaints <- statewise_complaints[,"Open"]
closed_complaints <- statewise_complaints[,"Closed"]
View(open_complaints)
View(closed_complaints)
states <- unique(trial_df$State)

# For loop to sum up each of the states' open + closed tickets
i <- 1
for (i in states) {
  print(i)
  print(as.numeric(open_complaints[i]) + as.numeric(closed_complaints[i]))
}

# The state of Georgia has the maximum complaints

############################################################################

## Which state has the highest percentage of unresolved complaints ##
 
# For loop to find the percentages of unresolved complaints
e <- 1
for (e in states) {
  print(e)
  print("Total complaints")
  print(as.numeric(open_complaints[e]) + as.numeric(closed_complaints[e]))
  print("Percent of unresolved complaints:")
  print( as.numeric(open_complaints[e]) / (as.numeric(open_complaints[e]) + as.numeric(closed_complaints[e])))
}

# The state of Kentucky has the highest percentage of unresolved complaints at 0.4285714 ~ 43%

############################################################################
## Provide the percentage of complaints resolved till date, which were received through the Internet and customer care calls. ##

# Use trial_df columns condensed_status & received.via
# Collect all complaints received through Internet & Customer care calls

calls_received_through_internet_and_ccarecalls <- table(trial_df$Received.Via, trial_df$condensed_status)
View(calls_received_through_internet_and_ccarecalls)

# From the view above we can see the closed tickets for customer care calls = 864 and internet = 843

calls_received_through_internet_and_ccarecalls[,"Closed"]
ccarecalls_internet_closed <- calls_received_through_internet_and_ccarecalls[,"Closed"]
ccarecalls_internet_open <- calls_received_through_internet_and_ccarecalls[,"Open"]
ccarecalls_internet_closed
ccarecalls_internet_open

ccarecall_closed <- ccarecalls_internet_closed["Customer Care Call"]
ccarecall_closed
internet_closed <- ccarecalls_internet_closed["Internet"]
internet_closed

ccarecall_open <- ccarecalls_internet_open["Customer Care Call"]
ccarecall_open
internet_open <- ccarecalls_internet_open["Internet"]
internet_open

total_tickets <- as.numeric(ccarecall_closed) + as.numeric(internet_closed) + as.numeric(ccarecall_open) + as.numeric(internet_open)
total_tickets

total_resolved_through_ccarecall_internet <- as.numeric(ccarecall_closed) + as.numeric(internet_closed)
total_resolved_through_ccarecall_internet

percentage_resolved_through_ccarecall_internet <- total_resolved_through_ccarecall_internet / total_tickets
percentage_resolved_through_ccarecall_internet

############################################################################

