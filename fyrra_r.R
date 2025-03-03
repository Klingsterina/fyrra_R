#*****
#* Hópurinn: Eygló Ástþórsdóttir
#* Skil á verkefni 7. mars 2025
#* Gögn notuð: Stack Overflow Annual Developer Survey
#*****Eygló Ástþórsdóttir

library(tidyverse)  # Fyrir gagnavinnslu
library(readr)      # Fyrir gagnainnlestur
library(dplyr)



## HLUTI 1

e <- read_csv("Fyrra_Gogn/survey_results_public_rev.csv")

e <- e %>%
  filter(MainBranch == "I am a developer by profession",
         Employment == "Employed, full-time")

nrow(e)  # Telur fjölda lína eftir síun
table(e$MainBranch)  # Sýnir tíðnidreifingu í MainBranch
table(e$Employment)  # Sýnir tíðnidreifingu í Employment

e <- e %>%
  mutate(YearsCode = as.numeric(YearsCode),
         YearsCodePro = as.numeric(YearsCodePro),
         years_before_pro = YearsCode - YearsCodePro)

summary(e$years_before_pro)

e %>% filter(years_before_pro < 0) %>% select(YearsCode, YearsCodePro, years_before_pro)

