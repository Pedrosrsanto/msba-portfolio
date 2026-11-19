# R Programming: Which eBay Categories Should a Reseller Focus On?

**Course:** OPAN 6606 Programming I: Intro to Data, Georgetown MSBA (Fall 2026)
**Tools:** R (base R, tidyverse/dplyr)
**Skills:** Vectors and indexing, loops and functions, `select()`, `mutate()` with `case_when()`, `summarize()` with `.by`, writing the same logic in base R and in dplyr

---

## The question

A reseller is deciding which product categories to focus their online storefront on, and handed over **1,223 historical eBay auctions** to mine for patterns before committing. The project builds across three classes: base R fundamentals, then loops and functions, then dplyr.

## What I found

- **Auction length:** the longest auctions ran 10 days (220 of them). The average was about 6.4 days, and 59% of auctions ran longer than that. Bucketed: 722 long (7 to 10 days), 330 medium (5 days), 171 short (1 to 3 days)
- **Close-to-open price ratio:** the raw average was about 119.6, which is misleading. A handful of auctions opened at $0.01, which blows up the ratio. Excluding those, the average is about **9.6**. For Computer auctions it's about 21.8
- **Highest average close price by category:** Electronics, then Automotive, then Pottery/Glass
- **Timing matters:** Computer auctions ending on a **Saturday** averaged a **$103.62** close, well above even the best category average (Electronics, $80.70)

## Recommendation

**Prioritize Automotive.** It has the second-best average close price ($55.19) and a high auction count, so it produces the highest total close value of any category. For Computers, aim for auctions that end on a Saturday, assuming the seller can control when an auction ends.

## How it's built

The same summary is written two ways, to show the logic both in base R and in the tidyverse:

```r
# Base R: average close price and count of auctions closing above the open price
category_summary <- function(df, category_name) {
  rows <- df$Category == category_name
  avgClose <- mean(df$ClosePrice[rows])
  countAbove1 <- sum(rows[df$Ratio > 1])
  cat("avgClose", avgClose, "\n countAbove1", countAbove1)
}

# dplyr version of the same function
category_summary_tidy <- function(df, category_name) {
  result <- filter(df, Category == category_name) |>
    summarize(avgClose = mean(ClosePrice),
              countAbove1 = sum(Ratio > 1))
  cat("avgClose", result$avgClose, "\n countAbove1", result$countAbove1)
}
```

Both versions were tested on the Computer and Books categories and return the same numbers.

I set myself one rule for this course: only use functions covered in class. It would have been faster to pull in extra packages, but the point of a first programming course is to understand what the code is doing.

## Also in this course

The R and Quarto work in this course built up to the **[Airbnb DC pricing project](../airbnb-dc-pricing)**, the joint final project with Stats for Business Analytics.

## Files

| File | Contents |
|---|---|
| `code/project1_ebay_auctions.R` | Full R script for Project 1 |
