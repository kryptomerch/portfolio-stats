# portfolio-stats

A small R toolkit for computing descriptive statistics on a portfolio of
daily stock closing prices. Built for the BDA400 *Technical Analysis using R*
project as a reusable, well-documented starting point.

## Overview

`portfolio-stats` reads a table of daily closing prices for one or more stock
symbols and returns a tidy summary — count, mean, median, standard deviation,
minimum, and maximum — for each symbol. It is intentionally small so it can be
dropped into a larger analysis pipeline.

## Installation

```r
# clone the repository, then from the project root:
install.packages("dplyr")      # the only dependency
source("R/portfolio_stats.R")  # loads the portfolio_stats() function
```

Requirements: R >= 4.1 and the `dplyr` package.

## Usage

```r
library(dplyr)
source("R/portfolio_stats.R")

prices <- data.frame(
  Symbol = c("AAPL", "AAPL", "MSFT", "MSFT"),
  Close  = c(188.2, 190.1, 410.5, 415.0)
)

portfolio_stats(prices)
#>   Symbol n mean_px median_px sd_px min_px max_px
#>   AAPL   2  189.15   189.15  1.34  188.2  190.1
#>   MSFT   2  412.75   412.75  3.18  410.5  415.0
```

## Input format

| Column | Type    | Description                    |
|--------|---------|--------------------------------|
| Symbol | character | Stock ticker symbol          |
| Close  | numeric   | Daily closing price          |

## Project structure

```
portfolio-stats/
├── README.md                 # this file
├── R/
│   └── portfolio_stats.R     # the portfolio_stats() function
└── data/                     # place synthetic price CSVs here
```

## Notes

- Use synthetic data only; no real or personal data is committed to this repo.
- `NA` prices are ignored in each statistic (`na.rm = TRUE`).

## License

MIT — for coursework/educational use.
