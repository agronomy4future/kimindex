<!-- README.md is generated from README.Rmd. Please edit that file -->

# kimindex

<!-- badges: start -->
<!-- badges: end -->

The goal of kimindex package is to predict grain weight (mg) from area (mm2) in bread wheat.

□ Code summary: https://github.com/agronomy4future/r_code/blob/main/Prediction_of_Grain_Weight_and_Area_in_Bread_Wheat_(feat_kimindex).ipynb

□ Code explained: https://agronomy4future.org/archives/23118

## Installation

You can install the development version of fwrmodel like so:

Before installing, please download Rtools (https://cran.r-project.org/bin/windows/Rtools)

``` r
if(!require(remotes)) install.packages("remotes")
if (!requireNamespace("kimindex", quietly = TRUE)) {
  remotes::install_github("agronomy4future/kimindex")
}
library(remotes)
library(kimindex)
```

## Example

This is a basic code to predict grain weight from grain area:

``` r
predicted_gw=kimindex(data, "grain_area", remove_na= TRUE)
*remove_na= TRUE: excluding missing values / remove_na= FALSE: including missing values

■ remove_na= TRUE: excluding missing values
■ remove_na= FALSE: including missing values
```

## Let’s practice with actual dataset

``` r
# to uplaod data
if(!require(readr)) install.packages("readr")
library(readr)
github="https://raw.githubusercontent.com/agronomy4future/raw_data_practice/main/Philipp_et_al_2018.csv"
df = data.frame(read_csv(url(github), show_col_types=FALSE))

head(df,5)
  grain_weight_mg grain_area_mm2
1           49.08           18.6
2           45.43           18.3
3           41.78           16.7
4           53.42           20.3
5           44.40           17.5
.
.
.

# to predict grain weight from area
predicted_gw= kimindex(df, "grain_area_mm2", remove_na= TRUE)

head(predicted_gw,5)
  grain_weight_mg grain_area_mm2 predicted_gw
1           49.08           18.6     47.39768
2           45.43           18.3     46.39118
3           41.78           16.7     41.11362
4           53.42           20.3     53.19793
5           44.40           17.5     43.73310
.
.
.
```
