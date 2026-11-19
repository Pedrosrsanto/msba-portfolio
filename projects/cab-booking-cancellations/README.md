# Which Cab Bookings Get Cancelled, and What to Do About It

**Course:** OPAN 6602 Machine Learning Foundations, Georgetown MSBA (Fall 2026)
**Team:** Pedro Sanchez and Anton van der Laar
**Tools:** Python (pandas, scikit-learn, statsmodels)
**Methods:** Missing-data diagnosis (structural vs. real gaps), KNN imputation, feature engineering, K-nearest neighbors classification (K swept from 1 to 301 with 10-fold CV), cutoff tuning for business costs, logistic regression for effect sizes

---

## The headline

**Booking channel is the biggest single driver of cancellations.** Bookings made on the mobile site cancel 14 to 17 points more often than identical bookings made by phone. Evening website and app city rides are only 7.6% of bookings but account for 31% of all cancellations. Confirming those rides by text alone would catch about 23 cancellations per 1,000 bookings before a car is sent.

## The business problem

About 7 in every 100 bookings at a cab company get cancelled. Each cancellation ties up a driver and a car for a job that never happens, in a slot that could have gone to another customer. Using 10,000 bookings from 2013 in the Bangalore area, we answered two questions:

1. Which bookings are most likely to fall through?
2. What can the operations team do about it before a car is dispatched?

## Getting the data right first

A lot of the blank fields weren't really missing data. They were blank because they don't apply to that kind of trip: packages only exist for hourly rentals, drop-off points only for city rides, and destination cities only for out-of-town trips. Treating those as missing values would have been a mistake.

Two fields did have real problems, and we left both out:

- **Return time** was blank for about 9 in 10 bookings from January to May and almost never blank after July, which points to a change in how it was recorded. On top of that, 1 in 17 recorded values came *before* the pickup time.
- **Pickup city** was usually blank, and almost always the same city when it was filled in.

We also fixed impossible entries, such as bookings created after their own pickup time.

## What drives cancellations

We compared bookings that are identical in every way except one, so each factor's effect is measured on its own. The average booking cancels 7.4% of the time.

| Compared with an otherwise identical booking... | Change in chance of cancelling |
|---|---|
| Booked on the mobile site instead of by phone | +14 to 17 points |
| Booked on the website instead of by phone | +9 to 10 points |
| Evening pickup (5pm to midnight) instead of daytime | +3 to 5 points |
| Booked more than a week ahead instead of 1 to 7 days | about +13 points* |
| Booked less than 3 hours ahead instead of 1 to 7 days | about +8 points* |
| Trip to or from the airport | about 7 points lower |

*The timing effect was weaker in our main model than in the others, so we flagged it as a softer finding.

Phone bookings cancel about 4% of the time, while app bookings are several times riskier. Airport trips sit at the other end: people don't skip their ride to a flight.

## How well the model works

The main model is a **K-nearest neighbors classifier** (scaled inputs, K = 101). Accuracy alone couldn't pick K: from K = 21 up, every model scored about 92.6%, which is exactly what you get by calling every booking "kept". So we chose K on AUC, then **lowered the cutoff to 0.10** so the model flags bookings worth a check-in. A logistic regression on the same features translates the patterns into percentage-point effects the operations team can read.

Tested on 2,000 bookings the model had never seen:

- Out of every 1,000 bookings, about 74 will cancel
- The model flags 256 bookings to check, and **44 of the 74 cancellations are on that list**
- A flagged booking is **more than twice as likely** to cancel as an average one
- Unflagged bookings cancel less than 5% of the time

We deliberately tuned the model to catch more cancellations at the cost of some false alarms. Checking in with a customer costs a text message. Missing a cancellation costs a wasted trip.

## Recommendations

1. **Confirm every evening website or app city ride before committing a car.** About 76 texts per 1,000 bookings to reach roughly 23 cancellations early.
2. **Widen to the model's full list when there's capacity.** 256 checks per 1,000 bookings reaches 44 cancellations: nearly twice as many for a bit more than three times the effort.
3. **Add a "tap to confirm" step in the app two hours before pickup.** Channel is the biggest single factor, so this is the cheapest place to start.
4. **Hold off assigning a driver to evening app bookings until they confirm.** With 3 in 10 of them not happening, holding a car for each one wastes capacity.
5. **Stop checking phone bookings to or from the airport.** They're 15% of bookings and cancel less than 1% of the time.
6. **Send a day-before reminder for bookings made more than a week out.** About 5% of bookings, with roughly 9% cancelling.

## What to keep in mind

- **These results show who to watch, not what will change behavior.** App customers may just have looser plans, so pushing them to book by phone wouldn't necessarily help. We proposed a simple trial: send confirmations to a random half of flagged bookings for a month and compare wasted trips against the other half.
- **Cancellations rose sharply through the year**, from 1 to 3% early on to 15 to 18% by November. Before relying on the model day to day, we'd test it on the most recent months and find out what caused the jump. Fixing that cause could matter more than any model.

## Files

| Folder | Contents |
|---|---|
| `report/Cab_Cancellations_Report.pdf` | Two-page report for the operations team |
| `code/cab_cancellations_knn.ipynb` | Full analysis notebook |
