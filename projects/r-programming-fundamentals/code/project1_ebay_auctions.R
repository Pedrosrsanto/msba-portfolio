# ============================================================
# OPAN 6606 -- Programming I
# Project 1 -- Classes 1-3
# Your name(s):
#
# A reseller is deciding which product categories to focus their
# online storefront on. They've handed you a sample of over 1,200
# historical eBay auctions to mine for patterns before they commit.
#
# This project builds across three classes -- work through each
# part once you have the skills for it:
#   Part 1 (after Class 1)  -- Q1-5,  base R fundamentals
#   Part 2 (after Class 2)  -- Q6-7,  loops and functions
#   Part 3 (after Class 3)  -- Q8-13, dplyr / data wrangling
#
# Optional pair assignment. Sign up with a partner on Canvas after
# Class 1; you'll be locked into your group (or working solo) by
# the start of Class 2.
#
# Assumes an R Project with the data file at:
#   data/eBayAuctions.csv
# ============================================================


# Part 1 (after Class 1) ----


# 1: Load the file "eBayAuctions.csv" and save it as auctionData.
# Confirm its dimensions.
auctionData <- read.csv("data/eBayAuctions.csv")
str(auctionData)
# 1223 rows, 6 columns


# 2: Write code that checks whether the dataset has any missing
# values, one that returns the number of auctions (rows), and one
# that returns the number of variables (columns).

sum(is.na(auctionData))   
# 0 -> no missing values
nrow(auctionData)        
# 1223 auctions
ncol(auctionData) 
# 7 variables


# 3: What is the maximum auction duration (in days)? How many
# auctions ran for that many days? What is the average auction
# duration? What percentage of auctions ran longer than average?

maxDuration <- max(auctionData$Duration)
maxDuration

#maxDuration is equal to 10 days

sum(auctionData$Duration == maxDuration)

# 220 auctions were ran for 10 days

avgDuration <- mean(auctionData$Duration)
avgDuration

# the average auction duration is about 6.42 days

mean(auctionData$Duration > avgDuration) * 100

# about 59% of the auctions ran longer than the average

# 4: Create a new column called Ratio: the ratio of ClosePrice to
# OpenPrice for each auction. Add it to auctionData. What's the
# average ratio across all auctions? What's the average ratio for
# just the "Computer" category?

auctionData$Ratio <- auctionData$ClosePrice / auctionData$OpenPrice

mean(auctionData$Ratio) #total average ratio
# average ratio across all auctions is about 119.6

mean(auctionData$Ratio[auctionData$OpenPrice != 0.01]) #average ratio excluding 0.01 open price
# average ratio across auctions except open price = 0.01 is about 9.58
#this excludes the extreme ratios which can be misleading


mean(auctionData$Ratio[auctionData$Category == "Computer"])
mean(auctionData$Ratio[auctionData$OpenPrice != 0.01 & auctionData$Category == "Computer"])
# average ratio for Computer auctions is about 21.8
#computer doesn't have any 0.01 values as OpenPrice (same result)


# 5: Create an object called catNames containing the unique auction
# categories, sorted alphabetically. How many categories are there?

catNames <- sort(unique(auctionData$Category))
catNames
length(catNames)

# 10 categories

# Part 2 (after Class 2) ----

# 6: Write a loop that goes through catNames and, for each category,
# calculates the average ClosePrice (avgClose) and the number of
# auctions with Ratio > 1 (countAbove1). Store both as vectors.

avgClose <- rep(NA, length(catNames))
countAbove1 <- rep(NA, length(catNames))

for (i in 1:length(catNames)) {
  rows <- auctionData$Category == catNames[i]
  avgClose[i] <- mean(auctionData$ClosePrice[rows])
  countAbove1[i] <- sum(rows[auctionData$Ratio > 1]) #sums true values (1,0) so it gives number of rows
}

avgClose
countAbove1

# 7: Combine catNames, avgClose, and countAbove1 into a data frame
# called catInfo. Write two different ways to return the 5th row's
# avgClose value.

catInfo <- data.frame(Categories = catNames, avgClose, countAbove1)

catInfo$avgClose[5] #from avgClose bring the 5th row

catInfo[5, "avgClose"] #from catInfo bring the 5th row from avgClose
#two ways of doing the same thing

# Part 3 (after Class 3) ----

library(tidyverse)

# 8: Using select(), create a trimmed version of auctionData called
# auctionTrim that drops the sellerRating column. Confirm its
# dimensions.

auctionTrim <- select(auctionData, -sellerRating)
dim(auctionTrim)

# 1223 rows and 5 columns

# 9: Using mutate() and case_when(), create a column called
# AuctionLength in auctionTrim that buckets Duration into "Short"
# (1-3 days), "Medium" (5 days), and "Long" (7-10 days). How many
# auctions fall into each bucket?

auctionTrim <-  mutate(auctionTrim, AuctionLength = case_when(
                            Duration <= 3 ~ "Short",
                            Duration == 5 ~ "Medium",
                            Duration >= 7 ~ "Long" # 10 is the max duration
                        ))

sum(is.na(auctionTrim$AuctionLength)) #to see if any observation fell outside the bucket  

table(auctionTrim$AuctionLength)

#722 long, 330 medium, 171 short

# 10: Using summarize() with .by, calculate the average ClosePrice
# and the number of auctions (n) for each Category -- without using
# group_by(). Which three categories have the highest average
# ClosePrice?

avgClose_tidy <- summarize(auctionTrim, 
                           avgClose = mean(ClosePrice),
                           num_auctions = n(),
                           .by = Category) |>
                  arrange(desc(avgClose))

#1 electronics, 2 automovile, 3 pottery/glass

# 11: Using summarize() with .by, calculate the average ClosePrice
# for each Category x endDay combination. Show the results for the
# "Computer" category -- which day of the week had the highest
# average ClosePrice for Computer auctions?

avgClose_end <- summarize(auctionTrim, 
                           avgClose = mean(ClosePrice),
                           num_auctions = n(),
                           .by = c(Category, endDay)) 


avgClose_end[avgClose_end$Category == "Computer", ]


arrange(avgClose_end[avgClose_end$Category == "Computer", ],desc(avgClose))
#Saturday is the day with the highest average close price (103.62)

# 12: Write a function called category_summary that takes the data
# and a category name, and returns the average ClosePrice and the
# count of auctions with Ratio > 1 for that category -- once using
# base R (as in Q6-7) and once using dplyr with .by (as in Q10).
# Test both versions on "Computer" and "Books" and confirm they
# return the same numbers.

category_summary <- function(df, category_name) {
  
    rows <- df$Category == category_name
    
    avgClose <- mean(df$ClosePrice[rows])
    countAbove1 <- sum(rows[df$Ratio > 1])
    cat("avgClose",avgClose, "\n countAbove1", countAbove1)
}

category_summary(auctionData, "Computer")
category_summary(auctionData, "Books")
#SAME RESULT AS EARLIER

category_summary_tidy <- function(df, category_name) {
 result <- filter(df, Category == category_name) |>
    summarize(avgClose = mean(ClosePrice),
              countAbove1 = sum(Ratio > 1)
    )
  cat("avgClose",result$avgClose, "\n countAbove1", result$countAbove1)
}

category_summary_tidy(auctionData, "Computer")
category_summary_tidy(auctionData, "Books")

# 13: Reflection (no code) -- Based on Q9-11, which one or two
# categories would you recommend the reseller prioritize, and why?
# Reference at least one specific number from your analysis.

mutate(avgClose_tidy, closexaction = avgClose*num_auctions) |>
  arrange(desc(closexaction))

#We would defintely recomend automovile, as it has the 2nd best avgClose (55.19) but also has
# a great number of actions, so you can make the greatest total earnigns with it (greatest price 
#to num of action)

#also it could be a great idea trying to resell computers on a Saturday, as the average close
#price that day (103.6) its greatly above even the best category average (Electronics with 80.7).
#This assuming that you can control/know the duration or at least when it ends (to make it end 
#on a Saturday)

