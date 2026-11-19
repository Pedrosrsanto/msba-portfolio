# SQL Lab: The Texas Housing Market, 2000 to 2015

**Course:** OPAN 6608 Programming III: Massive Data, Georgetown MSBA (Fall 2026)
**Tools:** SQL (SQLite), Jupyter with the `ipython-sql` extension
**Skills:** Filtering, boolean logic, aggregation, `GROUP BY` / `HAVING`, pattern matching, sorting and limits

---

## The data

A SQLite database of monthly housing market records for Texas cities from 2000 to 2015: city, year, month, number of sales, dollar volume, median sale price, active listings and months of inventory.

## Questions and findings

| # | Question | Answer |
|---|---|---|
| 1 | First 7 records | All Abilene, January to July 2000 |
| 2 | Records with more than 100 sales **and** a median price above $100k | **5,106** |
| 3 | Records with more than 100 sales **or** a median below $100k, by month | 546 (November) to 639 (May): spring and early summer lead |
| 4 | Top 20 city-years by mean monthly sales, excluding cities starting with H | Dallas takes the first 16 spots, led by **2006 (about 5,352 sales a month)**; Austin fills the rest |
| 5 | Austin sales, December 2010 | **1,561** |
| 6 | Austin's best month in 2010 | **May (2,286)**, then April (2,230). January was lowest at 985 |
| 7 | Top 5 city-months in 2010, excluding Austin | Houston takes the top four (May, June, April, March); Dallas in May is fifth (4,891) |
| 8 | Fewest sales ever | **San Marcos, October 2011: 6 sales** |
| 9 | Mean sales by year | Climbed from about 403 in 2000 to a peak of about 630 in 2006, fell through the housing crash to about 440 in 2010, then recovered to about 646 by 2015 |
| 10 | Years with mean sales above 600 | 2006, 2013, 2014 and 2015 |

## What the numbers say about the market

Taken together, the queries trace the full housing cycle in Texas: steady growth to 2006, a four-year slide through the crash, and a recovery that passed the old peak by 2015. Activity is seasonal, peaking in late spring, and heavily concentrated in Houston and Dallas.

## Code

All ten queries are in [`code/texas_housing_queries.sql`](code/texas_housing_queries.sql). An example: which years had mean monthly sales above 600?

```sql
SELECT year, AVG(sales) AS mean_sales
FROM housing
GROUP BY year
HAVING mean_sales > 600;
```
