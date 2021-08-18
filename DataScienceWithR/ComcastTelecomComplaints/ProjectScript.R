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
customer_complaints$Date <- as.Date(customer_complaints$Date, format = '%d/%m/%Y')
customer_complaints$Date

as.Date('15/1/2001', format='%Y/%m/%d')

# If date item has / change to -
# write function to replace / with -
grep("%-%-%", format_date)
format_date[format_date == "%/%/%"] <- "%-%-%"
format_date




indice_to_format
#format_date2 <- replace(customer_complaints$Date,)






# Monthly trend chart for number of complaints