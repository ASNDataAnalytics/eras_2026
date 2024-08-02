# 01 Libraries

require(readr)
require(dplyr)
require(lubridate)
require(stringr)
require(readxl)
require(asn)

# 02 df_edu_fun(): Function to combine IMG and US IMG values

df_edu_fun <- function(data = df_edu) {
  
  img <- data |>
    filter(
      str_detect(edu_status, "IMG")
    ) |> 
    # Make ERAS a factor so it is not summed in operation. 
    mutate(
      ERAS = as.factor(ERAS)
    )

   us <- data |>
    filter(
      !str_detect(edu_status, "IMG")
    ) |> 
    # Make ERAS a factor so it is not summed in operation. 
    mutate(
      ERAS = as.factor(ERAS)
    )
  
  # Identify the maximum number of programs between
  # IMGs and US IMGs for use in calculating 
  # Mean Applications Per Program 
  
  num_program <- img |> 
    group_by(month_year) |> 
    summarize(num_program = max(num_program))
  
  img <- img |> 
    select(ERAS:num_program, month) |> 
    group_by(ERAS, month_year) |> 
    summarize(
      across(
        c(num_candidate, num_application), 
        sum
      )
    ) |> 
    ungroup() |> 
    left_join(
      num_program, 
      by = "month_year"
    ) |> 
    mutate(
      mean_apps_candidate = num_application / num_candidate,
      mean_apps_program = num_application / num_program,
      month = lubridate::month(month_year),
      edu_status = "IMG"
    ) |> 
    relocate(
      edu_status, .after = month_year
    )
  # nolint: trailing_whitespace_linter.
  df <- bind_rows(
    us,
    img
  ) |> 
    arrange(month_year, edu_status)
  
  return(df)
  
}

# 02 Load Raw Historic Data...and hopefully ERAS 2025

df_edu <- 
  read_excel(
    "docs/data/2024-07-29_eras_historic_data.xlsx",
    sheet = "01_Edu-Status"
  )

# 03 ERAS Application Data: Combining Historic IMG Data ----

# 1. Limit Data Between July and November ----


df_edu <- 
  df_edu |> 
  mutate(
    month = lubridate::month(month_year) 
  ) |> 
  filter(
    between(month, left = 7, right = 11)
    ) |> 
  # Remove Incomplete Data from November 2016 (ERAS 2017)
  filter(
    ERAS >= 2018
  ) |>
  # Make ERAS a factor so it is not summed in munging operation. 
  mutate(
    ERAS = as.factor(ERAS)
  )

# 2. Combine IMG and US IMG Data for Consistency post-2018 (post-ERAS 2019) ----

df_edu <- 
  df_edu |> 
  df_edu_fun() |> 
  mutate(
    ERAS = as.character(ERAS) |> 
      as.numeric(),
    month_name = lubridate::month(
      month_year, 
      label = TRUE, 
      abbr = FALSE
    )
  )

cat(
  format_csv(df_edu)
)