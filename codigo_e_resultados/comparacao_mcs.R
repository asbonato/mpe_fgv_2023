library(MCS)
library(dplyr)
library(tidyr)
library(readxl)

rm(list = ls())
setwd("~/mpe-fgv-eesp/_dissertacao/codigo/revisao")
df_metricas <- read_excel("metricas.xlsx")

df_metricas_escolhidas <- df_metricas[df_metricas$Escolha == 1, 
                                      c('ano', 'experimento', 'estratégia', 'MAPE')]

df_mape <- df_metricas_escolhidas %>% pivot_wider(names_from = ano, values_from = MAPE)

modelos <- paste(df_mape$estratégia, df_mape$experimento)


loss_t <- as.matrix(df_mape[3:12])
rownames(loss_t) <- modelos
loss <- t(loss_t)

mcs <- MCSprocedure(Loss = loss, alpha = 0.15, B = 5000, statistic = 'Tmax', cl = NULL)
#mcs

