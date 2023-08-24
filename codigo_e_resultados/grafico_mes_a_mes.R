library(forecast)
library(readxl)
library(TSA)
library(ggplot2)

data <- read_excel("~/mpe-fgv-eesp/_dissertacao/codigo/final/variaveis_previsao.xlsx")

ICMS.ts <- ts(data[,'icms_sp'], start = c(2003, 1),end=c(2022,12), freq = 12)

ggmonthplot(ICMS.ts, xlab='', ylab='') +
  theme(panel.background = element_rect('#EAEAF2'))
