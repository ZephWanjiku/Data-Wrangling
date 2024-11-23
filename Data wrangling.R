library(lubridate)
library(dplyr)
library(ggplot2)
library(mdsr)
presidential
presidential %>%
  filter(start > 1973 & party == "Democratic") %>%
  select(name)
mypresidents <- presidential %>% mutate(term.length = interval(start, end)/ years(1))
mypresidents
mypresidents <- mypresidents %>% mutate(elected = year(start) - 1)
mypresidents
mypresidents <- mypresidents %>%
  mutate(elected = ifelse((elected %in% c(1962, 1973)), NA, elected))
mypresidents
mypresidents <- mypresidents %>% rename(term_length = term.length)
mypresidents
mypresidents %>% arrange(desc(term_length))