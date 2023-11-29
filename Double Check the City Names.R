# Double checking the City name 

library(tidyverse)

ZZ22_1 <- read.csv("CLEAN_ZZ22.csv")
ZZ18_1 <- read.csv("CLEAN_ZZ18.csv")
ZZ14_1 <- read.csv("CLEAN_ZZ14.csv")

df1 <- ZZ22_1 |>   distinct(CITY_NAME, .keep_all = TRUE) |>   select(CITY_CODE, CITY_NAME) 

df2 <- ZZ18_1 |>   distinct(CITY_NAME, .keep_all = TRUE) |>   select(CITY_CODE, CITY_NAME) 

df3 <- ZZ14_1 |>   distinct(CITY_NAME, .keep_all = TRUE) |>   select(CITY_CODE, CITY_NAME) 

df_list <- list(df1, df2, df3) 

unmatch_list1 <- Reduce(function(x, y) anti_join(x, y, by = "CITY_NAME"), df_list) 
unmatch_list1

unmatch_list2 <- Reduce(function(x, y) anti_join(x, y, by = "CITY_CODE"), df_list) 
unmatch_list2
