# portfolio_stats.R
# Compute basic descriptive statistics for a portfolio of daily closing prices.
# Input : a data frame with columns Symbol (chr) and Close (numeric)
# Output: a data frame of per-symbol statistics (mean, median, sd, min, max)

library(dplyr)

portfolio_stats <- function(prices) {
  stopifnot(all(c("Symbol", "Close") %in% names(prices)))
  prices %>%
    group_by(Symbol) %>%
    summarise(
      n        = dplyr::n(),
      mean_px  = mean(Close, na.rm = TRUE),
      median_px= median(Close, na.rm = TRUE),
      sd_px    = sd(Close, na.rm = TRUE),
      min_px   = min(Close, na.rm = TRUE),
      max_px   = max(Close, na.rm = TRUE),
      .groups  = "drop"
    )
}

# Example run on synthetic data
if (sys.nframe() == 0) {
  set.seed(1)
  demo <- data.frame(
    Symbol = rep(c("AAA", "BBB"), each = 20),
    Close  = c(round(rnorm(20, 100, 5), 2), round(rnorm(20, 50, 3), 2))
  )
  print(portfolio_stats(demo))
}
