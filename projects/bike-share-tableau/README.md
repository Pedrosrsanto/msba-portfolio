# Bike Share Insights: Seven Tableau Views for an Operations Team

**Course:** OPAN 6600 Visualization & Storytelling with Data, Georgetown MSBA (Fall 2026)
**Type:** Individual final assignment
**Tools:** Tableau (calculated fields, parameters, FIXED LOD expressions, maps, treemaps)
**Data:** 78,704 trips across 63 stations in the San Francisco Bay Area bike share system

---

## The headline

**This bike share runs on commuters riding the last mile to and from the train.** Transit hubs are 11 of 63 stations but start 24% of trips, the busiest single dock beats four whole cities combined, and casual riders go over the time limit 20 times more often than subscribers. Each view below ends with a specific action for the operator.

## The seven views

### 1. When do people ride? Weekday commute peaks
Two dark bands, 8 to 10am and 5 to 7pm on weekdays. Tuesday at 8am is the hottest cell, with 1,672 trips. Weekends barely register.

**A data fix first:** the start times were stored in UTC, which put the morning rush at 1pm. I built a *Local Start Time* calculated field that shifts each timestamp to local clock time, daylight saving included, and checked it against the date column on all 78,704 rows.
**Action:** do rebalancing and repairs midday or on weekends, and have docks full before 8am.

### 2. Transit hubs drive demand
A *Station Type* calculated field tags each start station as Caltrain, BART, Ferry Building or other. **Only 11 of 63 stations are transit hubs, but they start 18,990 trips (24%).** The biggest bubble, San Francisco Caltrain 2 (330 Townsend), has 7,904 trips: more than San Jose, Palo Alto, Redwood City and Mountain View combined (2,535).
**Action:** put the next station next to a train platform.

### 3. Rain hurts ridership, temperature doesn't
Each dot is one weekday (weekends removed with a *Day Type* calc). Across 41°F to 77°F the correlation between temperature and trips is **0.02**. Rainy weekdays average about 119 trips against 131 on clear days, roughly 9% fewer. The outliers are holidays and the December 11, 2014 storm (3.12 inches of rain), which cut ridership to 18.

### 4. Tourists stick to the waterfront
A *% Customer Trips* calc (one-time pass riders over all trips) on a San Francisco map. Systemwide, casual customers are **3.0%** of rides. At Embarcadero at Sansome it's **18.9%**, more than six times as much, and the top four stations on this metric all line the Embarcadero. The five busiest SoMa stations sit at 3.3% or below.
**Action:** day-pass marketing belongs on the waterfront, not in SoMa.

### 5. Reverse commuters: San Francisco to Mountain View
Every trip is tagged with the 94107 zip code (around the SF Caltrain station), yet **1,797 trips happen in Mountain View, 35 miles south, and 99% fall on weekdays.** A *Caltrain Direction* calc shows that between 7 and 10am, 99% of rides start at a Caltrain dock, and between 4 and 7pm, 97% end at one. People take the train down, ride the last mile to the office, and reverse it at night.

### 6. Casual riders blow past the 30-minute limit
An *Overtime Limit* parameter (default 30 minutes) drives a *% Over Limit* calc. **18.3% of casual rides go over, against 0.9% of subscriber rides**, about 20 times more often. At a 60-minute limit the gap gets wider (10.7% vs. 0.4%). Subscribers' median ride is 7 minutes; casual riders' is 15.
**Action:** spell out overtime fees on the pricing screen. Many casual riders probably don't know about them.

### 7. A few routes carry the system
A *Route* calc joins start and end stations, and a *Min Trips per Route* parameter drives a filter built on a **FIXED LOD expression**. **Of 1,287 routes, just 33 carry almost 30% of all trips.** 20 of those 33 touch Caltrain. Return trips show an imbalance: riders heading to the train pick the 4th Street Caltrain dock far more often, and it takes in about 3,000 more bikes than it sends out.
**Action:** start the rebalancing trucks' day at 4th Street.

## Techniques used

- **Calculated fields:** Local Start Time (UTC conversion), Station Type, Day Type, Weather Type, % Customer Trips, Caltrain Direction, % Over Limit, Route
- **Parameters:** Overtime Limit, Min Trips per Route
- **Level of detail:** a FIXED LOD filter for route volume
- **Chart types:** heat map, packed bubbles, scatter, symbol map, stacked bars, bar comparison, treemap

## Also in this course

- **[BSR pay equity Tableau story](../bsr-pay-equity)**: five-dashboard team presentation
- Practice workbooks on NFL player stats (fantasy points by draft round, hand size, trends by state) and earlier Bike Rentals assignments
- 
