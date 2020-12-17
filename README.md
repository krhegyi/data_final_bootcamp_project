# The price of flight delays

Final project of the Data Analytics Fulltime Bootcamp


## Content
* Project Description
* Methodology
* Conclusions
* Datasets
* Links

## Project Description

Are the flights from low-cost airlines delay more? Cheap airlines working with tighter timeline, they turnaround time is significantly less compared to the higher ranked companies. In my analysis I went behind to this assumption to see whether it's true.

**Hypothesis:** The economic airlines delay more.


## Methodology, workflow

In my analysis I used data for all Europen flights arriving to any of the German airport between 1st June 2020 and 31st August 2020. This dataset contains about 111.000 data points, which was collected via API.

The European airports' IATA codes, and the Global flight rice ranking list were gathered through web scraping.

The Global flight price ranking gave the basis of the 4 categories for how expensive an airline is. These four categories (low-cost, moderately low, moderately expensive, expensive) were compared to each other and were analysed via statistical method (ANOVA analysis).

The visualization (and the presentation) were created in Tableau -see link at the bottom of this page.


## Conclusions

Based on the statistical analysis the cheaper airlines don't delay significantly more compared to the more expensive ones, thus **I reject my hypothesis**.

Important to mention that this analysis were examining only flights arriving to Germany, for a shorter period of time. The conclusions can apply only for this limited dataset.


## Datasets

[Aviation API:] [https://aviation-edge.com/]

Airport codes: https://airportcodes.io/en/continent/europe/

Global flight price ranking: https://www.rome2rio.com/labs/2018-global-flight-price-ranking/


## Links
Presentation in Tableau: https://public.tableau.com/profile/kristof.hegyi#!/vizhome/Thepriceofcheapflights/Presentationflightdelays

