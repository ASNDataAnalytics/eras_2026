require(readr)
require(dplyr)
require(lubridate)
require(stringr)
require(readxl)
# require(asn)


df_total <-
  read_excel(
    "docs/data/2024-07-29_eras_historic_data.xlsx",
    sheet = "00_Monthly",
    na = "UK"
  )


df_total <- 
  df_total |> 
  mutate(
    month = lubridate::month(month_year),
    month_name = lubridate::month(
      month_year, 
      label = TRUE, 
      abbr = FALSE
    ) 
  ) |> 
  filter(
    between(month, left = 7, right = 11)
  ) |> 
  mutate(
    ERAS = as.numeric(ERAS)
  )

cat(
  format_csv(df_total)
)


# df_total |> 
#   write_csv(stdout())

# iris |> 
#   write_csv(stdout())

# cat(
#   format_csv(iris)
# )
