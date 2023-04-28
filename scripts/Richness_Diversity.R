# Check you have them and load them
list.of.packages <- c("iNEXT", "kableExtra", "tidyr", "ggplot2", "gridExtra", "dplyr", "viridis")

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
lapply(list.of.packages, require, character.only = TRUE)

library(tidyverse)

total_obs <- read.csv("data_raw/Algar_30min_independent_total_observations.csv", header=T)

total_obs_01 <- total_obs %>% 
  mutate(across(.cols = Alces.alces:Ursus.americanus, .fns = ~ if_else(. > 0, 1, 0)))

total_obs_01 <- total_obs_01 %>% 
  rowwise() %>% 
  mutate(richness = sum(c_across(Alces.alces:Ursus.americanus)))



# vegan and BiodiversityR
library(BiodiversityR) # also loads vegan
library(ggplot2)
library(ggsci)
library(readxl)
library(tidyverse)

data(warcom)
data(warenv)

# BiodiversityR
accumcomp(warcom, y=warenv, factor='population', 
          method='exact', conditioned=FALSE, plotit=FALSE)

algar <- total_obs %>% 
  column_to_rownames("Deployment.Location.ID") %>% 
  select(-Effort)

algar2 <- total_obs %>% select(-Effort)
write_csv(algar2, "data_raw/algar_data.csv")

# vegan
specaccum(warcom)
algar_specaccum <- specaccum(algar)

plot(algar_specaccum)

model <- fitspecaccum(algar_specaccum, model = "asymp")
coef(model)
fitted(model)
plot(model)

warcom_model <- fitspecaccum(warcom, model = "asymp")
coef(warcom_model)
fitted(warcom_model)
plot(warcom_model)


site1 <- algar %>% 
  slice(1) %>% 
  pivot_longer(Alces.alces:Ursus.americanus)

H_indices <- algar %>% 
  rownames_to_column("site") %>% 
  pivot_longer(Alces.alces:Ursus.americanus,
               names_to = "species", values_to = "abundance") %>% 
  filter(abundance > 0) %>% 
  group_by(site) %>% 
  mutate(N = sum(abundance),
         prop = abundance / N,
         ln_prop = log(prop),
         prop_ln_prop = prop * ln_prop) %>% 
  summarise(H = sum(prop_ln_prop) * -1)


# one site at a time


# remove species not observed
site1 <- site1[site1$value > 0,]

site1$pi <- site1$value / N
site1$ln_pi <- log(site1$pi)
site1$pi_lnpi <- site1$pi * site1$ln_pi

H <- sum(site1$pi_lnpi) * -1



# tidyverse version
N <- sum(site1$value)

site1 <- site1 %>% 
  filter(value > 0) %>% 
  mutate(pi = value / N,
         ln_pi = log(pi),
         pi_lnpi = pi * ln_pi) %>% 
  summarise(H = sum(pi_lnpi) * -1)


# New Dataset ####

sp_comm <- readr::read_csv("https://raw.githubusercontent.com/guysutton/CBC_coding_club/master/data_raw/species_abundance_matrix_ex.csv") %>%
  # Clean column names 
  janitor::clean_names() %>% 
  dplyr::select(-c(provinces, climatic_zones, site, season, haplotype))

sac <- specaccum(sp_comm)
coef(sac)

fit_sac <- fitspecaccum(sac, model = "asymp")
coef(fit_sac)
plot(fit_sac)


# New Dataset ####
fish <- read_csv("data_raw/DoubsSpe.csv", skip_empty_rows = TRUE) 
fish <- fish[ , -1]
write_csv(fish, "data_raw/Doubs_fish.csv")

fish_sac <- specaccum(fish)
fit_fish_sac <- fitspecaccum(fish_sac, model = "asymp")

coef(fit_fish_sac)
plot(fit_fish_sac)
