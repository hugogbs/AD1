library(GGally)
library(pscl)
library(broom)
library(tidyverse)
library(modelr) # devtools::install_github("hadley/modelr")

theme_set(theme_bw())

speed_dating <- read_csv("speed-dating2.csv")

dating <- speed_dating %>%
  select(dec, like) %>%
  na.omit() %>%
  mutate(dec = as.factor(dec))

like_model <- glm(dec ~ like,
                  data = dating,
                  family = "binomial")

tidy(like_model, conf.int = TRUE, exponentiate = TRUE) %>% 
  select(-statistic, -p.value)

expec_real <- augment(like_model,
                      type.predict = "response") %>%
  mutate(previsto = .fitted > .5, 
         real = dec == "yes")

table(expec_real$previsto, expec_real$real)

glance(like_model)
pR2(like_model)

#ggpairs(dating)
# dating %>% 
#   ggplot(aes(x = like, fill = dec)) + 
#   geom_bar(position = "dodge")


