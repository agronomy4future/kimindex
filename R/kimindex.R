#' Calculate Grain Weight from Grain Area (Kim Index) of Bread Wheat
#'
#' This function predicts the grain weight (mg) for wheat based on the grain area (mm2)
#' using the equation y = x^1.32, where y is the grain weight and x is the grain area.
#'
#' @param data A data frame containing the grain area or grain weight
#' @param area_col The name of the column in the data frame that contains the grain area. This name can be any column that holds the grain area data.
#' @return The input data frame with an additional column `predicted_gw` representing the predicted individual grain weight from each grain area.
#' @export
#' @examples
#' predicted_grain_weight= kim_index(data, "grain_area", remove_na= FALSE OR TRUE)
#'
kimindex= function(data, area_col, remove_na= FALSE) {

  # Load necessary libraries
  library(dplyr)

  # Convert the area column to numeric (if not already)
  data[[area_col]]= as.numeric(data[[area_col]])

  # Calculate the grain weight using the equation y = x^1.32
  data= data %>%
    mutate(predicted_gw= .data[[area_col]] ^ 1.32)

  # If remove_na is TRUE, discard rows with NA in predicted_gw
  if (remove_na) {
    data= data %>%
      filter(!is.na(predicted_gw))
  }

  # Return the modified data frame
  return(data)
}
