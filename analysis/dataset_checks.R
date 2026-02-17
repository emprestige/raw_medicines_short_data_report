# import librarys
library(here)
library(arrow)
library(tidyverse)

# import dataset
df <- read_feather(here::here("output", "dataset.arrow"))

# inspect data
df_sum <- df %>%
  summarise(
    av_meds = mean(meds_row_no),
    av_reps = mean(repeats_row_no),
    av_meds_id = mean(meds_rep_id_no),
    av_reps_id = mean(repeats_rep_id_no),
    n_ids_differ = sum(rep_ids_differ),
    av_concord = mean(concordant_dates),
    av_discord = mean(discordant_dates)
  )

# save summary
write_csv(df_sum, here::here("output", "dataset_check.csv"))